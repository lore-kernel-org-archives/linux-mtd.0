Received: from [63.81.120.155] (helo=imap.sh.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fztzo-0003TG-VT
	for linux-mtd@lists.infradead.org; Mon, 10 Jul 2006 07:32:16 -0400
Message-ID: <44B23256.8030504@ru.mvista.com>
Date: Mon, 10 Jul 2006 14:56:22 +0400
From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [2.6 patch] make drivers/mtd/cmdlinepart.c:mtdpart_setup() static
References: <20060626220215.GI23314@stusta.de>	<1151416141.17609.140.camel@hades.cambridge.redhat.com>	<20060629173206.GF19712@stusta.de>
	<1152436332.25567.12.camel@shinybook.infradead.org>
In-Reply-To: <1152436332.25567.12.camel@shinybook.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: juha.yrjola@solidboot.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, jlavi@iki.fi, Adrian Bunk <bunk@stusta.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

David Woodhouse wrote:

>>>>This patch makes the needlessly global mtdpart_setup() static.

>>>>Signed-off-by: Adrian Bunk <bunk@stusta.de>
>>>>
>>>>--- linux-2.6.17-mm2-full/drivers/mtd/cmdlinepart.c.old 2006-06-26 23:18:39.000000000 +0200
>>>>+++ linux-2.6.17-mm2-full/drivers/mtd/cmdlinepart.c     2006-06-26 23:18:51.000000000 +0200
>>>>@@ -346,7 +346,7 @@
>>>>  *
>>>>  * This function needs to be visible for bootloaders.
>>>>  */
>>>>-int mtdpart_setup(char *s)
>>>>+static int mtdpart_setup(char *s) 

>>>Patch lacks sufficient explanation. Explain the relevance of the comment
>>>immediately above the function declaration, in the context of your
>>>patch. Explain your decision to change the behaviour, but not change the
>>>comment itself.

>>My explanation regarding the relevance of the comment is that it seems 
>>to be nonsense.

>>Do I miss something, or why and how should a bootloader access 
>>in-kernel functions? 

> I'm not entirely sure, but allegedly it does -- Juha, can you elaborate?

    In addition, this function might be needed to support parsing of the 
partition info extracted from the OF device tree (if this way of storing it 
there will be accepted)...

WBR, Sergei
