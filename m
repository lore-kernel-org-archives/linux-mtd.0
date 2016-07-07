Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bLETO-0000y5-3F
 for linux-mtd@lists.infradead.org; Thu, 07 Jul 2016 18:56:30 +0000
Subject: Re: [PATCH 5/5] mtd: Don't print a scary message when trying to
 remove a busy MTD
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1467669983-12105-1-git-send-email-richard@nod.at>
 <1467669983-12105-6-git-send-email-richard@nod.at>
 <20160707165805.636d1b47@bbrezillon> <577EA408.4000406@nod.at>
 <20160707205326.2e525525@bbrezillon>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <577EA5C7.8030102@nod.at>
Date: Thu, 7 Jul 2016 20:56:07 +0200
MIME-Version: 1.0
In-Reply-To: <20160707205326.2e525525@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris,

Am 07.07.2016 um 20:53 schrieb Boris Brezillon:
>>> Nit: can you keep the brackets around the if (mtd->usecount) block (we
>>> usually only drop them when both the 'if' and 'else' blocks contain
>>> a single instruction)?
>>>   
>>
>> As discussed on IRC, the current kernel coding style is fine with that.
> 
> That's not what's described in Documentation/CodingStyle [1], but for
> reason checkpatch is not complaining (I thought it was, but maybe this
> rule has been relaxed).
> 
> I still find it clearer to have brackets in this case, but I'll let
> Brian decide.
> 
> [1]http://lxr.free-electrons.com/source/Documentation/CodingStyle#L168

I don't care much, if you prefer it the other way I'll happily change it.
So, please await v2. :-)

Thanks,
//richard
