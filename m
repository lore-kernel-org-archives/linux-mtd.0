Received: from mail.milliontech.com ([210.17.151.186])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ATh6N-0004aB-T7
	for <linux-mtd@lists.infradead.org>; Tue, 09 Dec 2003 12:36:32 +0000
Message-ID: <3FD5C197.7080502@milliontech.com>
Date: Tue, 09 Dec 2003 20:35:35 +0800
From: Martin Chan <martinc@milliontech.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <3FD5B024.5050808@milliontech.com>
	<1070969637.31993.125.camel@hades.cambridge.redhat.com>
In-Reply-To: <1070969637.31993.125.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: IPL block is bad on DiskOnChip 2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Great! It works. Thanks David.

Martin

David Woodhouse wrote:

>On Tue, 2003-12-09 at 19:21 +0800, Martin Chan wrote:
>  
>
>>Dear all,
>>
>>I have successfully DFORMATted my MD2202-D64 today, and try to install a
>>jffs2 file system to it.
>>    
>>
>
>Assuming you have no bad blocks on your DiskOnChip, you need to erase it
>with 'eraseall' first.
>
>Really, you shouldn't be doing this before we properly sort out the bad
>block management on these devices.
>
>  
>
