Received: from aibo.runbox.com ([193.71.199.94])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L77Zp-0000bN-Lp
	for linux-mtd@lists.infradead.org; Mon, 01 Dec 2008 12:08:34 +0000
Message-ID: <4933D3B5.9070507@runbox.com>
Date: Mon, 01 Dec 2008 07:08:21 -0500
From: Cal Page <pagcal@runbox.com>
MIME-Version: 1.0
To: "Ostendorf, Rainer" <Rainer.Ostendorf@BENNING.de>
Subject: Re: Problems with JFFS2 FS during parallel write operations
References: <0F0EC10F42A3384392AE60EF2A660B40427D98@tbbsrv56>
In-Reply-To: <0F0EC10F42A3384392AE60EF2A660B40427D98@tbbsrv56>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

You might check the locks in mtd. I noticed they were pretty low. It 
might make sense in your case to move them to mtdpart.c or even up into 
yaffs_mtdif2.c for the read/write/erase functions.

Cal Page

Ostendorf, Rainer wrote:
> Hi list,
>
> i'm still working on the problem described in my previous post:
>
> [...]
>   
>> During normal operation the system runs perfectly stable, but when i 
>> start two processes running parallel, writing huge amounts of data 
>> to the flash device, i get error 
>> messages from the JFFS2 filesystem:
>>
>> ...
>> argh. node added in wrong place
>> argh. node added in wrong place
>> ...
>>
>> This message repeats for about 15-20 times while copying parallel 2 
>> files of about 6MByte to the flash via Ethernet (SCP). 
>>     
> [...]
>
> As i can only reproduce the corruption of the JFFS2 FS during parallel access of at leat two processes writing to the flash, i assume that the cause for the corruption is some kind of race-condition. Have there been any known problems/bugs with race conditions, that could lead to an error like this? Would it probably help to upgrade to a newer kernel version? Any hint and help would be greatly appreciated.
>
> best regards,
> Rainer
>
>
> Benning Elektrotechnik und Elektronik GmbH & Co. KG Bocholt
> Handelsregister Coesfeld HRA-Nr. 4661
> Persönlich haftende Gesellschaft: Benning GmbH
> Handelsregister Coesfeld HRB-Nr. 7772
> Geschäftsführer: Th. Benning
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
>   
