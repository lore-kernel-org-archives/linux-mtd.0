Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8Pc4-0001Du-2y
 for linux-mtd@lists.infradead.org; Wed, 29 Jan 2014 07:31:08 +0000
Message-ID: <52E8AE25.8080502@nod.at>
Date: Wed, 29 Jan 2014 08:30:45 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Richard Weinberger <richard.weinberger@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] reproducable ubifs reboot assert and corruption
References: <20140122051510.GB17284@gmail.com>
 <CAFLxGvwmzftdQKSjjjwpFLS8g3EJqMrQ2gU2scBsh2MvG7Wyyw@mail.gmail.com>
 <20140127163939.GA27809@gmail.com> <20140129053238.GA6035@gmail.com>
In-Reply-To: <20140129053238.GA6035@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 29.01.2014 06:32, schrieb Andrew Ruder:
> Ok, I've got some more useful information.  I have been adding
> a multitude of WARN_ON's and prink's all over the remount code and have
> come up with the attached log.
> 
> A little bit of explanation:
> 
> Line 1: sync_filesystem (from do_remount_sb)
> Line 188: sync_filesystem ends
> Line 43, 64, 81, 98, 114, 135, 156, 173: write operations that occur
> during sync_filesystem.  Before each warning I print the inode pointer.
> Line 197: read-only remount has completely finished (this message is
> from userspace post remount)
> Line 199: a sync is called, there are apparently dirty inodes in our
> now-readonly ubifs filesystem
> Line 215: failed assert that occurs because the writeback triggers for
> inode 0xd75b9450 (see line 41, it got in with a sys_write while we were
> running our sync_filesystem in do_remount_sb)
> 
> Does this help?  It looks like there is a race condition between the
> writeback code and the remount read-only.  Nothing is done to lock out
> writes during the first half of the do_remount_sb and some stuff makes
> it into the writeback worker queue while we are busy syncing the
> filesystem only to trigger later when ubifs has decided it is
> read-only...
> 
> Note: I only barely know what I am talking about - filesystems still not
> my forte :)

BTW: Can you please share your .config?

Thanks,
//richard
