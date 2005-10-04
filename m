Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EMmiI-0000GV-0p
	for linux-mtd@lists.infradead.org; Tue, 04 Oct 2005 09:20:22 -0400
Message-ID: <43428171.9060101@ru.mvista.com>
Date: Tue, 04 Oct 2005 17:19:45 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Vitaly Bordug <vbordug@ru.mvista.com>
References: <434130A3.2090908@ru.mvista.com>
In-Reply-To: <434130A3.2090908@ru.mvista.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] MTD NAND: Fix ECC errors in au1550nd.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Vitaly Bordug wrote:

<snip>

>+
>+			if( (command == NAND_CMD_READ0) || (command == NAND_CMD_READOOB) ){
>+				save_flags(g_cpu_flags_cmd);
>+				cli();
>  
>
Don't you want to sti() it somewhere?

Vitaly
