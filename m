Received: from wproxy.gmail.com ([64.233.184.204])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Cf7t9-0008LZ-EI
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2004 21:30:40 -0500
Received: by wproxy.gmail.com with SMTP id 58so11534wri
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Dec 2004 18:30:31 -0800 (PST)
Message-ID: <f8521c9904121618302afe15e4@mail.gmail.com>
Date: Fri, 17 Dec 2004 11:30:31 +0900
From: heechul Yun <heechul.yun@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: [patch] Endian problem of nftl_format and nftldump
Reply-To: heechul Yun <heechul.yun@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello 

It seems that both programs should #include <endian.h>.  
If not, the following code can cause problem as it becomes always true. 

#if __BYTE_ORDER == __BIG_ENDIAN 
... 


Regards, 
Heechul. 

===========
Heechul Yun
Digital Media Research Center 
Samsung Electronics 
Tel: +82-31-200-9334
