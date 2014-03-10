Received: from mail-we0-x229.google.com ([2a00:1450:400c:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WMxTF-0000d6-V2
 for linux-mtd@lists.infradead.org; Mon, 10 Mar 2014 10:30:12 +0000
Received: by mail-we0-f169.google.com with SMTP id w62so8379429wes.14
 for <linux-mtd@lists.infradead.org>; Mon, 10 Mar 2014 03:29:45 -0700 (PDT)
Sender: Christian Riesch <christian.riesch@gmail.com>
Date: Mon, 10 Mar 2014 11:29:40 +0100
From: Christian Riesch <christian.riesch@omicron.at>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3] mtd: Fix the behavior of OTP write if there is not
 enough room for data
Message-ID: <6D2BD8A1EF0B77D28EAC3FF9@[172.22.2.41]>
In-Reply-To: <20140309045615.GK31517@norris-Latitude-E6410>
References: <4cb7a3dd-9eac-41c5-8498-f2695f01576c@mary.at.omicron.at>
 <20140309045615.GK31517@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--On March 08, 2014 20:56 -0800 Brian Norris <computersforpeace@gmail.com> 
wrote:

> On Thu, Mar 06, 2014 at 12:42:37PM +0100, Christian Riesch wrote:
>> If a write to one time programmable memory (OTP) hits the end of this
>> memory area, no more data can be written. The count variable in
>> mtdchar_write() in drivers/mtd/mtdchar.c is not decreased anymore.
>> We are trapped in the loop forever, mtdchar_write() will never return
>> in this case.
[...]
>> Signed-off-by: Christian Riesch <christian.riesch@omicron.at>
>> Cc: Brian Norris <computersforpeace@gmail.com>
>> ---
[...]
> Thanks for the update. Pushed to l2-mtd.git!

Thanks!
Based on this work I have now also reworked my patches for OTP support for 
drivers/mtd/chips/cfi_cmdset_0002.c. The discussion on earlier versions of 
this patchset led to the two fixes that you took into l2-mtd now. I am 
looking forward to your comments on v3 of the patchset [1].
Christian

[1] http://lists.infradead.org/pipermail/linux-mtd/2014-March/052422.html
