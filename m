Received: from motgate3.mot.com ([144.189.100.103])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18LkOm-0006At-00
	for <linux-mtd@lists.infradead.org>; Tue, 10 Dec 2002 13:26:08 +0000
Reply-To: <fred@sc23.sc.mcel.mot.com>
From: "fred" <fred@sc23.sc.mcel.mot.com>
To: <manningc2@actrix.gen.nz>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: Which filesystem can live on one flash sector?
Date: Tue, 10 Dec 2002 21:56:31 +0800
Message-ID: <000101c2a053$f2732f80$940879c8@sc.mcel.mot.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20021210071208.F30D7154A1@dragon.actrix.co.nz>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Ok, I understand I can't run JFFS at only one sector.

In fact, I have 64k space left for saving configuration data.
The size of a sector is 64k normally except the bottom sectors that are 8k,
4k, 4k, 16k, 32k.
So you see, I have five sectors to run JFFS rather than one 64k sector.
Then, is it possible to run JFFS on these sectors?

-----Original Message-----
From: Charles Manning [mailto:manningc2@actrix.gen.nz]
Sent: Tuesday, December 10, 2002 3:07 PM
To: fred@sc23.sc.mcel.mot.com
Subject: Re: Which filesystem can live on one flash sector?

On Tue, 10 Dec 2002 19:02, you wrote:
> Hi,
>
> I am using CRAMFS plus RAMFS on my board.
> And there is only one sector left for saving configuration data.
> Can I put a file system, e.g. JFFS, on it?


I don't see how any fs - alive or dead - could live in one sector. You need
at least one free sector to do garbage collection. (more for any real file
system).

Sounds to me like you'll just have to use it as raw flash.

-- Charles
