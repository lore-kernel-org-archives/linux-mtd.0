Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JimS8-0003h3-77
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 08:11:44 +0000
Message-ID: <47F9D5FF.1070308@nokia.com>
Date: Mon, 07 Apr 2008 11:06:23 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: ext Ram <vshrirama@gmail.com>
Subject: Re: issues with Nand tests
References: <8bf247760804050842q5407de1bq8400fcea75d1e875@mail.gmail.com>
In-Reply-To: <8bf247760804050842q5407de1bq8400fcea75d1e875@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Ram wrote:
> Hi,
> Im testing nand device using fs-tests package that comes with mtd-git.
> I am using linux 2.6.23.
> 
> Right now, i am facing a few issues, i would appreciate your advice in
> this regard.
> 
> !) All the the tests passes except that the stress test ./stress00.sh
> throws up the message as shown below.
> during the test, However the test passes successfully.

Not exactly.  The different tests test different things.  The stress
tests are trying to break the file system / mtd / driver.  They check
return codes from system calls, but they do not check that the data in
files is correct.  Forcing errors from the file system / mtd / driver
are what the tests do, so in this case the test effectively failed.

> 
> mtd->read(0x3c8 bytes from 0x59725c) returned ECC error
> Data CRC failed on REF_PRISTINE data node at 0x0059725c: Read
> 0x32e9ab7f, calculated 0xb1b6afa0
> mtd->read(0x3dc bytes from 0x597764) returned ECC error
> Data CRC failed on REF_PRISTINE data node at 0x00597764: Read
> 0x70c076f0, calculated 0x2d5d9d38
> mtd->read(0x99c bytes from 0x59849c) returned ECC error
> Data CRC failed on REF_PRISTINE data node at 0x0059849c: Read
> 0xa2908a1a, calculated 0x364b837f
> mtd->read(0x1044 bytes from 0x598eb4) returned ECC error
> Data CRC failed on REF_PRISTINE data node at 0x00598eb4: Read
> 0xb882b629, calculated 0x5e66e5b0
> mtd->read(0x1044 bytes from 0x599ef8) returned ECC error
> Data CRC failed on REF_PRISTINE data node at 0x00599ef8: Read
> 0x8819eb58, calculated 0x83e2d097
> mtd->read(0x1044 bytes from 0x59af3c) returned ECC error
> Data CRC failed on REF_PRISTINE data node at 0x0059af3c: Read
> 0xe9c03ff1, calculated 0xd85bc634
> mtd->read(0x1044 bytes from 0x59bf80) returned ECC error
> Data CRC failed on REF_PRISTINE data node at 0x0059bf80: Read
> 0xebcbe14f, calculated 0xa3f6ce10
> mtd->read(0x1044 bytes from 0x59cfc4) returned ECC error
> Data CRC failed on REF_PRISTINE data node at 0x0059cfc4: Read
> 0xd8533cde, calculated 0x5130dbf6
> mtd->read(0x1044 bytes from 0x59e008) returned ECC error
> Data CRC failed on REF_PRISTINE data node at 0x0059e008: Read
> 0xe6f84772, calculated 0x30f06f3d
> 
> 
> My question is what can one conclude on the above - can i say the nand
> drivers/linux mtd are working
> perfectly!. -;)

Nope.

> How does one isolate the problem of this nature since all the tests
> are passing except for the
> occasional ECC error.

The ECC errors mean that what was written to the flash was different
from what was read back.  It could be the driver is imperfect.  Check
the latest MTD tree for patches that might relate.

Also the errors look like they could come from a single eraseblock,
so maybe it is just a bad block.

> 2) My 2nd question is regarding the time taken for running
> 
>  Each run of all the tests take more than 6 hours to complete to test
> a partition of 16MB.
>  All the tests run only once, (repeat count is 0) and -z (size
> parameter is 0 that is
>  all the test fills the file system until there is no space left.)
> 
> The clock to the nand device is around 125MHZ.
> 
>  I observe that the "test processes" keep oscillating between "-D"
> (uninterruptible sleep) and -R (Running)
>  during the course of the test.
> 
>  When i do a ls -Rl on the test partition, i observe that the output
> is not continuous, It stops intermittently
>   and then continous.
> 
>  Is this normal behaviour.

Not sure what you mean.  If you mean the output from the ls pauses,
then that is normal - it is competing with the tests for resources,
and some of the tests really stress JFFS2.

> 
> Thanks and Regards,
>   Sriram
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
