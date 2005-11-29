Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EgyD9-00075E-D9
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 00:39:31 -0500
Message-ID: <438BE988.5090606@ru.mvista.com>
Date: Tue, 29 Nov 2005 08:39:20 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Vitaly Bordug <vbordug@ru.mvista.com>
References: <438B52FE.9040802@ru.mvista.com>
In-Reply-To: <438B52FE.9040802@ru.mvista.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: Add support for the MPC8xxADS boards
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Vitaly (no, I'm not talking to myself! :) ),

Vitaly Bordug wrote:

>+/* pointer to MPC885ADS board info data */
>+extern unsigned char __res[];
>+
>+static int __init init_mpc8xxads_mtd(void)
>+{
>+	bd_t *bd = (bd_t *)__res;
>  
>
I'd like to suggest using platform_data here instead of this global.
Please see how mainstone-flash.c is organized as an example.

Best regards,
   Vitaly
