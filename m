Received: from myyr.colleduc.ee ([193.40.113.30] helo=kiire.colleduc.ee)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CWBMf-0007Bn-KP
	for linux-mtd@lists.infradead.org; Mon, 22 Nov 2004 05:24:14 -0500
Message-ID: <41A1BE40.2000106@colleduc.ee>
Date: Mon, 22 Nov 2004 12:24:00 +0200
From: Kalev Lember <kalev@colleduc.ee>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <200411221211.12394.skorinkod@mosk.ru>
In-Reply-To: <200411221211.12394.skorinkod@mosk.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: mkfs.ext3 - segmentation fault
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dmitry Skorinko wrote:
<snip>

>EIP is at mtd_erase_callback+0x6/0x3b [mtdpart]
>  
>
<snip>

>Help, plz.  Thanks.
>  
>
I fixed this in the CVS about two weeks ago and sent a note about the 
fix to the list. Try the current CVS.

-- 
Best regards,
Kalev Lember
