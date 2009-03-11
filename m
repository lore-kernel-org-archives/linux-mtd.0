Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LhLjC-0006Ut-DE
	for linux-mtd@lists.infradead.org; Wed, 11 Mar 2009 10:32:06 +0000
Message-ID: <49B792F8.7020609@nokia.com>
Date: Wed, 11 Mar 2009 12:31:20 +0200
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Iram Shahzad <iram.shahzad@jp.fujitsu.com>
Subject: Re: UBIFS recovery truncates file to zero size
References: <F8252D21B3AD45E1A003F69611EA04E0@sky>
	<6b5362aa0903110251y3b0d23bcy61b20db12ba8c1e1@mail.gmail.com>
In-Reply-To: <6b5362aa0903110251y3b0d23bcy61b20db12ba8c1e1@mail.gmail.com>
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Brijesh Singh <brij.singh@samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brijesh Singh wrote:
> On Wed, Mar 11, 2009 at 2:46 PM, Iram Shahzad
> <iram.shahzad@jp.fujitsu.com> wrote:
>> I am having the following problem with UBIFS (Linux 2.6.25 + ubifs-v2.6.25).
>> Please could you tell me if this is a known issue.
>>
>> Problem
>>   If the power is switched off abruptly while a file is being written,
>>   in the next boot the contents of the file is lost. That is, the file
>>   becomes zero sized. The problem is reproducable.
> 
> May be because of write-back support.  Try disabling it.mount with sync option.

There was also a problem with busybox implementation of vi which truncated
the file to zero length.  See revision 21928 here:

	http://sources.busybox.net/index.py/trunk/busybox/editors/vi.c?view=log&pathrev=22471
