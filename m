Received: from myyr.colleduc.ee ([193.40.113.30] helo=kiire.colleduc.ee)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CaEYu-0005dY-Qx
	for linux-mtd@lists.infradead.org; Fri, 03 Dec 2004 09:37:34 -0500
Message-ID: <41B07A23.20409@colleduc.ee>
Date: Fri, 03 Dec 2004 16:37:23 +0200
From: Kalev Lember <kalev@colleduc.ee>
MIME-Version: 1.0
To: skorinkod@mail.ru
References: <200412021931.05132.skorinkod@mosk.ru>
	<200412031242.12036.skorinkod@mail.ru>
In-Reply-To: <200412031242.12036.skorinkod@mail.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Booting from DiskOnChip
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dmitry Skorinko wrote:

>People!
>Help me to install grub to DiskOnChip, plz...
>Just for BIOS see it... Then I will install system self
>
>This problem stops all my work :(
>  
>
Why don't you try the docboot boot loader that is included in linux-mtd cvs?
It has much less overhead and is considarably simpler to understand than 
the GRUB and LILO.

I believe your Diskonchip should be supported.

-- 
Best regards,
Kalev Lember
