Received: from postman.ateme.net ([217.167.236.59])
	by pentafluge.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D0kUs-0001vR-Mz
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2005 17:59:00 +0000
Message-ID: <4210E6C3.9030208@ateme.fr>
Date: Mon, 14 Feb 2005 18:58:27 +0100
From: =?ISO-8859-1?Q?Fr=E9d=E9ric_Janot?= <f.janot@ateme.fr>
MIME-Version: 1.0
To: Estelle HAMMACHE <estelle.hammache@st.com>
References: <4210DB19.9000808@ateme.fr> <4210DEDB.DD35E2DE@st.com>
In-Reply-To: <4210DEDB.DD35E2DE@st.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2_get_inode_nodes(): Data CRC failed on NAND device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Estelle,

Thanks for this very fast answer !!!

Estelle HAMMACHE wrote:

>JFFS2 on NAND flash uses a page buffer. It is flushed to the flash when
>it is full, or when you do fsync, sync or umount.
>  
>
Does that mean that I have to call fsync each time after fclose a file ?
Even if I do not edit some files, I get this kind of error. Does that 
mean something (jffs2 itself or other) write some data to the flash all 
the time ?

>Some data may remain in the page buffer and is never written
>to the Flash.
>  
>
So I really loose some data :(

>>If I umount / before rebooting, I don't have one more error message at
>>the next reboot.
>>    
>>
>
>This is correct procedure if you don't want to lose any data.
>  
>
It is an embedded board without power supervisor. I cannot detect when 
the customer power down the board :(

Frederic
