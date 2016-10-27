Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bzfGe-00082J-Ve
 for linux-mtd@lists.infradead.org; Thu, 27 Oct 2016 07:38:30 +0000
Date: Thu, 27 Oct 2016 09:38:01 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Danesh Daroui <Danesh.Daroui@ascom.com>
Cc: Steve deRosier <derosier@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: OOB Test fails
Message-ID: <20161027093801.7695f05e@bbrezillon>
In-Reply-To: <39BC08CB3FF4C84CB6397533D4FC79095770D530@SEGOTEXCH02.ascom-Resource.ads>
References: <39BC08CB3FF4C84CB6397533D4FC79095770D513@SEGOTEXCH02.ascom-Resource.ads>
 <CALupW3CJ_gXS+7BrZEGTF8o0H8pJ_AOw0JcKOftSVaMVSbP1zQ@mail.gmail.com>
 <39BC08CB3FF4C84CB6397533D4FC79095770D530@SEGOTEXCH02.ascom-Resource.ads>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Danesh,

On Wed, 26 Oct 2016 16:28:43 +0000
Danesh Daroui <Danesh.Daroui@ascom.com> wrote:

> Hi Steve,
> 
> Thank you for your prompt answer. When I run OOB test (mtd_oobtest), for instance, one of devices always return verification failed error on a certain address. This is all we know and all the test reports. We use a quite old kernel i.e. 2.6.39 and this is one of the things that we suspect as a source of the problem that the kernel is outdated. Also, we consider the hardware failure since on some devices no error is shown on OOB test while on others more errors are shown and the address is changed randomly sometimes.

Yes, please, try with a newer kernel: I won't help debugging such an
old thing.

> 
> Our main problem is that sometimes UBIFS forces the device into read-only mode due to "bad CRC" error at startup when the device is booted. I am now running tests which are in "mtd_utils" for testing file system. I have started running two tests which are "simple/test_1" and "simple/test_2" which simply write until the drive is full and the read the data back and verify the correctness. During the test, I see lots of:
> 
> UBI: scrubbed PEB 585 (LEB 3:770), data moved to PEB 1772
> UBI: scrubbed PEB 1045 (LEB 3:1261), data moved to PEB 828
> UBI: scrubbed PEB 1493 (LEB 3:664), data moved to PEB 814
> UBI: scrubbed PEB 751 (LEB 3:1260), data moved to PEB 1772
> 
> In my mind, this is related to problematic hardware that the data is corrupted on many cells that UBIFS tries to move the data when a corruption is detected. My question is, whether this guess can be valid or this is mostly due to old kernel that we are using and upgrading to a new kernel would most likely solve the problems?

Well, I can't tell. It can be caused by a buggy NAND controller driver,
a bug in the UBI layer or maybe your NAND is simply worn.

Try with a newer kernel, and let's see what the MTD tests and MTD utils
tests say.

BTW, which NAND and NAND controller are your testing on?

Regards,

Boris
