Received: from mail-qa0-f41.google.com ([209.85.216.41])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SHVPK-0001yb-B1
 for linux-mtd@lists.infradead.org; Tue, 10 Apr 2012 07:22:31 +0000
Received: by qafl39 with SMTP id l39so2297387qaf.0
 for <linux-mtd@lists.infradead.org>; Tue, 10 Apr 2012 00:22:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD3351F9CAD87@dekaexchange07.deka.local>
References: <CAHMF36FsVeg=ZVtZZz8H6YLj3GhKwD-ofCV1hcJcL5cVVKRK1A@mail.gmail.com>
 <CAN8TOE-2exM1YomfbiQ_CzkZn=MbotYwSxJnzU6mNVK4WPBNdQ@mail.gmail.com>
 <CAHMF36GrBOZBTzyBpxD2U+nkBcZExGqkvKY7fkA6494M2PtShw@mail.gmail.com>
 <0A40042D85E7C84DB443060EC44B3FD3351F9CAD87@dekaexchange07.deka.local>
Date: Tue, 10 Apr 2012 09:22:27 +0200
Message-ID: <CAHMF36F57m3Eksv8OXqO71JUDowD39DikpsozzokAV9+w_2HCw@mail.gmail.com>
Subject: Re: Unstable bits and JFFS2
From: Matej Kupljen <matej.kupljen@gmail.com>
To: Atlant Schmidt <aschmidt@dekaresearch.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Brian Norris <computersforpeace@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To all,

>> Artem, you said that this unstable bits only happen
>> during power cuts, is this right? Would those appear
>> also on simulated power cuts, the ones that integck
>> can produce?

I've been trying to find the issue with my device over last week and for now,
I didn't find anything.

Here is what I've done:
Please NOTE, that I have used THE SAME device for testing, which showed
the problems in the past.
1) I've prepared SD card and booted the device from it. Then I run the
integchk without
    simulating power cuts. The test run form more then 96 hours (four
days and nights)
    and nothing happened. I mean, no errors were reported.
2) I made a simple "power cut simulator", which cuts the power to the
device. The device
    was booted from SD card, then the UBIFS partition on NAND Flash was mounted.
    The test file was removed, and then a new file was created with
simple dd from
    /dev/zero to the test file on UBIFS.
    The test run for 72 hours and again, nothing happened.
3) Now I am running the test, with power cut simulator, bit this time
the device is booted
    from UBIFS. It has been running for more then 12h at the moment,
and for now it
    is still working as expected.

The only real thing from previous tests is that now, I have formatted
the UBIFS from
the device, when it was booted from SD card and Linux was up and running.
Previous tests were done (when I've noticed the problems) only when U-Boot was
running and the ubinized image was flashed to Flash trough U-Boot.

Could this be the problem?
Maybe different timings or something in U-Boot compared to Linux?

Thank you and Best Regards,
Matej Kupljen
