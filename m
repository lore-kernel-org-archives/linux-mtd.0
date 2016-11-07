Subject: Re: [PATCH 13/22] mtd: nand: lpc32xx: return error code of
 nand_scan_ident/tail() on error
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1478256190-7452-1-git-send-email-yamada.masahiro@socionext.com>
 <1478256190-7452-14-git-send-email-yamada.masahiro@socionext.com>
 <20161106192743.00e401ec@bbrezillon>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org, Sylvain Lemieux <slemieux.tyco@gmail.com>,
 linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org
From: Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <c9983167-cedd-3246-ccb8-54aad229e275@mleia.com>
Date: Mon, 7 Nov 2016 02:30:08 +0200
MIME-Version: 1.0
In-Reply-To: <20161106192743.00e401ec@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On 11/06/2016 08:27 PM, Boris Brezillon wrote:
> On Fri,  4 Nov 2016 19:43:01 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> The nand_scan_ident/tail() returns an appropriate error value when
>> it fails.  Use it instead of the fixed error code -ENXIO.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---

[snip]

>> -	if (nand_scan_tail(mtd)) {
>> -		res = -ENXIO;
>> +	res = nand_scan_tail(mtd);
>
> You miss
>
> 	if (res)
>
> here.
>
> No need to resend, I'll fix it when applying the patches.
>
>>  		goto err_exit3;
>> -	}
>>

nice catch, thank you for noticing and fixing the overlooked bug!

--
With best wishes,
Vladimir
