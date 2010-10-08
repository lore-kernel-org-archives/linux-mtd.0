Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P49im-00074C-3A
	for linux-mtd@lists.infradead.org; Fri, 08 Oct 2010 09:58:37 +0000
Received: by ewy9 with SMTP id 9so470998ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Oct 2010 02:58:33 -0700 (PDT)
Message-ID: <4CAEEADF.5070103@mvista.com>
Date: Fri, 08 Oct 2010 13:56:47 +0400
From: Sergei Shtylyov <sshtylyov@mvista.com>
MIME-Version: 1.0
To: "Nori, Sekhar" <nsekhar@ti.com>
Subject: Re: [PATCH 2/2] davinci: Platform support for OMAP-L137/AM17x NOR
	flash driver
References: <1286451272-12988-1-git-send-email-savinay.dharmappa@ti.com>
	<4CADE1B8.50800@mvista.com>
	<B85A65D85D7EB246BE421B3FB0FBB59302342ADE9D@dbde02.ent.ti.com>
In-Reply-To: <B85A65D85D7EB246BE421B3FB0FBB59302342ADE9D@dbde02.ent.ti.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Aleksey Makarov <amakarov@ru.mvista.com>,
	"davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Dharmappa, Savinay" <savinay.dharmappa@ti.com>,
	David Griego <dgriego@mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

On 08-10-2010 8:54, Nori, Sekhar wrote:

>>> +static void da830_evm_nor_done(void *data)
>>> +{
>>> +   clk_disable(da830_evm_nor.clk);
>>> +   clk_put(da830_evm_nor.clk);
>>> +   iounmap(da830_evm_nor.latch.addr);
>>> +   release_mem_region(DA8XX_AEMIF_CS3_BASE, PAGE_SIZE);
>>> +   iounmap(da830_evm_nor.aemif.addr);
>>> +   release_mem_region(DA8XX_AEMIF_CTL_BASE, SZ_32K);
>>> +}

>>      Why you've changed this function which was useful also for the error cleanup
>> before?

> The issues down below aside, I think goto based error handling
> is clearer to follow. Any objections to using goto based
> error handing per-se?

    I think the code was more compact with the old error handling. And anyway, 
I'm not feeling happy when TI is changing MV's code.

> Thanks,
> Sekhar

WBR, Sergei
