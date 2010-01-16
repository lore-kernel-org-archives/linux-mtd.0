Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NWFym-0002UC-Rq
	for linux-mtd@lists.infradead.org; Sat, 16 Jan 2010 21:14:49 +0000
Received: by fxm22 with SMTP id 22so1460312fxm.2
	for <linux-mtd@lists.infradead.org>;
	Sat, 16 Jan 2010 13:14:43 -0800 (PST)
Subject: Re: Ubi2- using NandSim for simulating flash and mounting ubi.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shweta Shetty <shyamashweta@gmail.com>
In-Reply-To: <c58fcbf21001080316j4ff51fe6wcb20eefd0d57e101@mail.gmail.com>
References: <c58fcbf21001080316j4ff51fe6wcb20eefd0d57e101@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 16 Jan 2010 23:14:40 +0200
Message-Id: <1263676480.8276.107.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

sorry, I am not sure understand the question.

On Fri, 2010-01-08 at 16:46 +0530, Shweta Shetty wrote:
> Hi,
> 
> To test ubi2 we intend to use NANDSIM. However we are facing certain problems.
> 
> From what we have understood, the method of using NANDSIM is :
> 1>create an empty flash device (By default this uses the ram memory
> but we can allocate other by the cache_file option)
> 2>mount ubi on it
> 3>mount ubifs on it
> => (Here we can load the previously stored image)

If you want to write some pre-created image (e.g., created with
mkfs.ubifs/ubinize) or previously saved image (e.g., you dumped
your /dev/mtdX to a file previously), then you have to do this _before_
attaching the MTD device to UBI. IOW, you have to do this between steps
1 and 2.

> 4>use it
> 5>while unmounting save the image on permanant storage

After you have unmounted everything, you can save it, yes.

> So as we can see, though NANDSIM can be effectively used for
> simulating flash , it is of limited use in our project for testing
> mount time as every time only the empty device is mounted.

No. You can write your contents there before mounting.

> From the ubi code that we have now studied , there is a flag set for
> an empty device and in such case , all the system does is that it
> initialises all its data structures.

It does this _only_ if you feed it an empty flash. Do not feed it an
empty flash, feed it a formatted flash, then it will not initialize it.

> Hence we cannot show the
> performance of our project on NANDSIM.

Well, of course in any case, performance is better shown on a real
device.

> Our we missing some crucial point?
> We would be grateful for clarification.

Not sure I clarified, because I did not really understand the question,
but HTH.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
