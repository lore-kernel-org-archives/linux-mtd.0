Received: from moat.murgatroid.com ([69.17.55.116] helo=mail.murgatroid.com)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CB29k-0006gC-BZ
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2004 22:19:25 -0400
From: "Christopher Hoover" <ch@murgatroid.com>
To: "'Todd Poynor'" <tpoynor@mvista.com>,
	<linux-mtd@lists.infradead.org>
Date: Fri, 24 Sep 2004 19:18:57 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <4154C897.3030008@mvista.com>
Message-Id: <20040925021907.D14A2A00043@mail.murgatroid.com>
Cc: 
Subject: RE: Supporting flash that is locked by default
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Various flash chips may be locked (at a chip or block level) 
> at power-on 
> (perhaps depending on the board wiring), requiring an unlock before 
> writing to the device.

I raised this issue several years ago.  There wasn't (to me at least) a
satisfactory answer.  I carry a private patch forward from release to
release that performs the unlock operation in the mtd map code.  

Basically I do this which gets called in the probe:

static void __init xxxx_unlock_mtd(struct mtd_info *mtd)
{
	int i;

	/* argh, no way to get to the slaves that make up the parts of
	   our device, so instead cruise over all the available
	   devices */
	for (i = 0;; i++) {
		struct mtd_info *info;

		info = get_mtd_device(0, i);
		if (!info)
			break;

		if ((info->flags & MTD_WRITEABLE) &&
		    (info->unlock)) {
			int ret;
		
			printk(KERN_DEBUG "unlocking mtd device %s\n",
info->name);
			ret = info->unlock(info, 0, info->size);
			if (ret)
				printk(KERN_ERR "failed (%d) to unlock mtd
device %s\n", ret, info->name);
		}

		put_mtd_device(info);
	}
}               

Somone (either rmk or David -- I don't recall whom) didn't feel the unlock
belonged in the mapping code and didn't want the patch.   It would be nice
to come up with a solution that pleased everyone.

-ch
