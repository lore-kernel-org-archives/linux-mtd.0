Received: from mail-wg0-f41.google.com ([74.125.82.41])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1So8YF-00075r-S2
 for linux-mtd@lists.infradead.org; Mon, 09 Jul 2012 07:38:57 +0000
Received: by wgbds1 with SMTP id ds1so2116168wgb.0
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jul 2012 00:37:59 -0700 (PDT)
Date: Mon, 9 Jul 2012 10:37:47 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: UBI fastmap updates
Message-ID: <20120709103747.5270084d@pixies.home.jungo.com>
In-Reply-To: <4FF9780D.4010709@nod.at>
References: <1340982869-77042-1-git-send-email-richard@nod.at>
 <20120708144745.36109029@pixies.home.jungo.com>
 <4FF9780D.4010709@nod.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: nyoushchenko@mvista.com, artem.bityutskiy@linux.intel.com,
 linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, thomas.wucher@linutronix.de,
 linux-mtd@lists.infradead.org, tim.bird@am.sony.com, tglx@linutronix.de,
 Marius.Mazarel@ugal.ro
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Sun, 08 Jul 2012 14:07:41 +0200 Richard Weinberger <richard@nod.at> wrote:
> > +			/* TODO: in the new locking scheme, produce_free_peb is
> > +			 * called under wl_lock taken.
> > +			 * so when returning, should reacquire the lock
> > +			 */
> 
> Which new locking scheme?

I am diffing linux-ubi fastmap HEAD against its fork point (vanilla
ubi), that's 6b16351..d41a140 on linux-ubi.

Which gives the following diff in produce_free_pebs:

@@ -261,7 +266,6 @@ static int produce_free_peb(struct ubi_device *ubi)
 {
 	int err;
 
-	spin_lock(&ubi->wl_lock);
 	while (!ubi->free.rb_node) {
 		spin_unlock(&ubi->wl_lock);
 
@@ -272,7 +276,6 @@ static int produce_free_peb(struct ubi_device *ubi)
 
 		spin_lock(&ubi->wl_lock);
 	}
-	spin_unlock(&ubi->wl_lock);
 
 	return 0;
 }

Which is probably okay, since you obtain the lock in the new
'ubi_refill_pools', which calls produce_free_peb:

+void ubi_refill_pools(struct ubi_device *ubi)
+{
+	spin_lock(&ubi->wl_lock);
+	refill_wl_pool(ubi);
+	refill_wl_user_pool(ubi);
+	spin_unlock(&ubi->wl_lock);
+}

However if 'do_work' fails within 'produce_free_peb', you return the
error but leave wl_lock unlocked - where it is expected to be locked
(otherwise, ubi_refill_pools will unlock it again):

static int produce_free_peb(struct ubi_device *ubi)
{
	int err;

	while (!ubi->free.rb_node) {
		spin_unlock(&ubi->wl_lock);

		dbg_wl("do one work synchronously");
		err = do_work(ubi);
		if (err)
			return err;

		spin_lock(&ubi->wl_lock);
	}

	return 0;
}

Regards,
Shmulik
