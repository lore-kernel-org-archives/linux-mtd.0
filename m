Received: from mail-wg0-f41.google.com ([74.125.82.41])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SUxHP-00026r-Er
 for linux-mtd@lists.infradead.org; Thu, 17 May 2012 09:45:56 +0000
Received: by wgbds1 with SMTP id ds1so5904159wgb.0
 for <linux-mtd@lists.infradead.org>; Thu, 17 May 2012 02:45:53 -0700 (PDT)
Date: Thu, 17 May 2012 12:45:48 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/7] [RFC] UBI: Export next_sqnum()
Message-ID: <20120517124548.262c132a@pixies.home.jungo.com>
In-Reply-To: <1337178457.24809.56.camel@sauron.fi.intel.com>
References: <1337101871-31181-1-git-send-email-richard@nod.at>
 <1337101871-31181-2-git-send-email-richard@nod.at>
 <20120516170324.337f2932@pixies.home.jungo.com>
 <1337178457.24809.56.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Heinz.Egger@linutronix.de, linux-mtd@lists.infradead.org, tim.bird@am.sony.com,
 tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Wed, 16 May 2012 17:27:37 +0300 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Wed, 2012-05-16 at 17:03 +0300, Shmulik Ladkani wrote:
> > Comment above the function should have been changed too.
> > (look for the "next_sqnum - get next sequence number" comment)
> 
> I do not think we should make these non-static. We should re-use the
> entire scan_peb() function instead to scan the fastmap internal volume.

Sorry, couldn't follow you.

The new (outside eba.c) calls to 'ubi_next_sqnum' are from
'ubi_write_fastmap' (called from the 'ubi_update_fastmap' interface,
implemented in fastmap.c) - during construction of VID headers of the
FM_SB and FM_FATA.

IMO this is reasonable.

Do you suggest to somehow use existing ubi_eba_write_xxx functions?
Or place the FM_SB/FM_DATA peb writing funtions into eba.c?

Regards,
Shmulik
