Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFjil-0007Fd-QR
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2013 11:19:48 +0000
Message-ID: <1363173638.11441.24.camel@sauron.fi.intel.com>
Subject: Re: MTD : Kernel oops when remounting ubifs as read/write
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mark Jackson <mpfj-list@mimc.co.uk>
Date: Wed, 13 Mar 2013 13:20:38 +0200
In-Reply-To: <51405F3A.3090901@mimc.co.uk>
References: <5134CEF9.5070502@mimc.co.uk>
 <1363087506.3348.62.camel@sauron.fi.intel.com>
 <51405F3A.3090901@mimc.co.uk>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, adrian.hunter@intel.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-03-13 at 11:12 +0000, Mark Jackson wrote:
> > -	if (c->space_fixup) {
> > -		err = ubifs_fixup_free_space(c);
> > -		if (err)
> > -			goto out;
> > -	}
> > -
> >  	mutex_unlock(&c->umount_mutex);
> >  	return err;
> > 
> 
> Sorry ... this just locks up the unit.

Am I right that to reproduce it I need any image with the 'fixup' flag
set, then I should put it on the flash, mount it R/O and then remount
R/W. Right?

-- 
Best Regards,
Artem Bityutskiy
