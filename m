Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NeoeN-0002Li-Jm
	for linux-mtd@lists.infradead.org; Tue, 09 Feb 2010 11:53:07 +0000
Subject: Re: fsck.ubifs?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jon Ringle <jon@ringle.org>
In-Reply-To: <152584231002010817n765ffd96j7f628d1f23a84b7c@mail.gmail.com>
References: <152584231002010817n765ffd96j7f628d1f23a84b7c@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 09 Feb 2010 13:52:04 +0200
Message-ID: <1265716324.2006.133.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-02-01 at 11:17 -0500, Jon Ringle wrote:
> I have my ubi0 partitioned with two static volumes: kernel and
> squashfs, and one dynamic volume: ubifs.

OK.

> One of the tests that I do to test for recovery from corruption is
> perform a flash_erase on random blocks on the mtd device that ubi0 is
> on and reboot. During bootup, I am able to easily detect corruption in
> the static ubi volumes with the crc checksum and these images are
> automatically reflashed.

OK.

> However, if there is corruption in the ubifs, quite often ubifs mounts
> successfully and only when trying to access files are problems being
> reported. Is there any kind of fsck.ubifs type of utility that can be
> used to help with this problem?

Unfortunately we did not implement any fsck.ubifs.

In your situation, the easiest think to do is to try to read all files
in the FS and make sure they can be read.

In general, UBIFS is very recoverable FS, and it can recover from many
errors nicely, so that only minimum of data is lost. See the
"recoverability" part here:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_overview

But we did not implement any utility which could do this.

And I think it is much much easier to doe the recovery in the kernel.
Probably some mount option like 'recover' could be introduced to do
this. But again, we did not implement this.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
