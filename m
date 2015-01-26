Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YFtTV-00036n-DF
 for linux-mtd@lists.infradead.org; Mon, 26 Jan 2015 23:53:46 +0000
Message-ID: <54C6D36F.1090509@nod.at>
Date: Tue, 27 Jan 2015 00:53:19 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/2 v2] UBI: Add initial support for scatter gather
References: <1420926734-16417-1-git-send-email-richard@nod.at>
In-Reply-To: <1420926734-16417-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, computersforpeace@gmail.com,
 dwmw2@infradead.org,
 =?ISO-8859-15?Q?Guido_Mart=EDnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 10.01.2015 um 22:52 schrieb Richard Weinberger:
> Adds a new set of functions to deal with scatter gather.
> ubi_eba_read_leb_sg() will read from a LEB into a scatter gather list.
> The new data structure struct ubi_sgl will be used within UBI to
> hold the scatter gather list itself and metadata to have a cursor
> within the list.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
> Tested-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Can I please get a Reviewed-by for this patch?

Thanks,
//richard
