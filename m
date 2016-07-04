Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bK0Mt-0005K0-9h
 for linux-mtd@lists.infradead.org; Mon, 04 Jul 2016 09:40:44 +0000
Subject: Re: [PATCH] mtdpart: propagate _get/put_device()
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1467231263-3974-1-git-send-email-richard@nod.at>
 <20160704113558.0daab438@bbrezillon>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <577A2F00.2060008@nod.at>
Date: Mon, 4 Jul 2016 11:40:16 +0200
MIME-Version: 1.0
In-Reply-To: <20160704113558.0daab438@bbrezillon>
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

Am 04.07.2016 um 11:35 schrieb Boris Brezillon:
> On Wed, 29 Jun 2016 22:14:23 +0200
> Richard Weinberger <richard@nod.at> wrote:
> 
>> If the master device has callbacks for _get/put_device()
>> and this MTD has slaves a get_mtd_device() call on paritions
>> will never issue the registered callbacks.
>> Fix this by propergating _get/put_device() down.
>>
>> Signed-off-by: Richard Weinberger <richard@nod.at>
> 
> Nit below, otherwise it looks good to me:
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Will send a v2 without the extra blank line and the typo
in the commit message. :)

Thanks,
//richard
