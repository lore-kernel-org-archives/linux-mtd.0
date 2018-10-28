Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gGqI9-00066C-Lf
 for linux-mtd@lists.infradead.org; Sun, 28 Oct 2018 19:00:12 +0000
From: Richard Weinberger <richard@nod.at>
To: Ben Greear <greearb@candelatech.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: read-only FS with error -2
Date: Sun, 28 Oct 2018 19:59:52 +0100
Message-ID: <3653061.hV2SDYrdd6@blindfold>
In-Reply-To: <0e90fe2a-1747-7a4c-9b6b-576dfdfad86d@candelatech.com>
References: <14ebdb35-43e6-47b6-e947-2d9f9cee100b@candelatech.com>
 <12453083.5lVtCAIVAB@blindfold>
 <0e90fe2a-1747-7a4c-9b6b-576dfdfad86d@candelatech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ben,

Am Sonntag, 28. Oktober 2018, 19:44:46 CET schrieb Ben Greear:
> > For now you can just use your initramfs (AFAIK OpenWRT has one), boot with rdinit=/bin/sh ...
> >
> > Or apply a hacky patch like this one to enable chk_fs always...
> 
> Problem is, when I re-install then the problem goes away.  Would it
> be bad to enable this code all the time on production systems?

Did you face the problem more than *once*?

chk_fs makes mounting very slow, it is basically a fsck upon mount.
 
> Could UBIFS just enable debugging and print out any pertinent
> info when it detects the failure instead of (just) going into RO
> mode?

UBIFS prints a ton on debug information upon unexpected situations.
But if your logs are gone and you have only very the last one (after a reboot),
UBIFS cannot do much...

Thanks,
//richard
