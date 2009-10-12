Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MxHdP-0002bY-MM
	for linux-mtd@lists.infradead.org; Mon, 12 Oct 2009 09:56:11 +0000
Message-ID: <4AD2FD26.9010403@nokia.com>
Date: Mon, 12 Oct 2009 12:55:50 +0300
From: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
MIME-Version: 1.0
To: "Bityutskiy Artem (Nokia-D/Helsinki)" <Artem.Bityutskiy@nokia.com>
Subject: Re: [PATCH 0/2] Revised: MTD: OneNAND: multiblock erase support
References: <1254819360-17191-1-git-send-email-ext-mika.2.korhonen@nokia.com>
	<1255260331.16942.37.camel@localhost>
In-Reply-To: <1255260331.16942.37.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "amul.saha@samsung.com" <amul.saha@samsung.com>,
	"kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Hunter Adrian \(Nokia-D/Helsinki\)" <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bityutskiy Artem (Nokia-D/Helsinki) wrote:
> On Tue, 2009-10-06 at 11:55 +0300, Mika Korhonen wrote:
>   
>> This patch series is a reworked version of
>>
>> http://lists.infradead.org/pipermail/linux-mtd/2009-September/027138.html
>> http://lists.infradead.org/pipermail/linux-mtd/2009-September/027139.html
>> http://lists.infradead.org/pipermail/linux-mtd/2009-September/027140.html
>>
>> based on comments by Adrian Hunter and Kyungmin Park. This version should
>> address the issues pointed out by them and apply on the current mtd tree.
>>
>> The original patch is:
>> http://lists.infradead.org/pipermail/linux-mtd/2009-June/026130.html
>>
>> I split the original patch in two for readability: the first part extracts
>> the execution of erase command to a separate function for easier integration
>> of different erase method. The second part implements the multiblock erase
>> function in case multiple blocks are requested to be erased and the chip is
>> not Flex.
>>
>> This is useful for flashing applications that need to do their work as
>> fast as possible. For full 64 eraseblock case the erase speed is up to 30x
>> faster. (Samsung: 64 MB/s vs 2.1 GB/s, I got 1.4 GB/s on Linux kernel)
>>     
>
> Mika, I've tried to apply your patches to my tree, but they do not apply
> any more because of recent printk cleanups:
>
> http://git.infradead.org/mtd-2.6.git/commit/297758f8fc4e92b1915d2f5f2f84cedfe8941e5a
>
> Could you please refresh your patches against the current MTD tree and
> re-send?
>   
There you are, I just resent them.

br,
Mika
