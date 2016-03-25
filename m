Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ajMdZ-0007V3-OF
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2016 07:58:31 +0000
Subject: Re: [PATCH 0/5] drivers/mtd: make several functions return bool
To: Yaowei Bai <baiyaowei@cmss.chinamobile.com>,
 Dongsheng Yang <dongsheng.yang@easystack.cn>
References: <1458873715-3670-1-git-send-email-baiyaowei@cmss.chinamobile.com>
 <56F4A87B.5090100@easystack.cn> <20160325063153.GA3319@yaowei-K42JY>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <56F4EF87.4000003@nod.at>
Date: Fri, 25 Mar 2016 08:57:59 +0100
MIME-Version: 1.0
In-Reply-To: <20160325063153.GA3319@yaowei-K42JY>
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

Am 25.03.2016 um 07:31 schrieb Yaowei Bai:
> On Fri, Mar 25, 2016 at 10:54:51AM +0800, Dongsheng Yang wrote:
>> ccing: Brian and Richard
>>
>> Hi Yao,
>>     Is that really necessary? I am not sure how much benefit we can
>> achieve from this change.
>> Could you explain more?
> 
> Yes, according to these functions' name, a boolean return value is more
> suitable and matchable.
> 
> Also personally think this change maybe benfit function's return value 
> storage in the stack when called on certain architectures.

On which archs? And what exactly is the benefit?
I agree that bool might be a better choice for new functions
but here you're touching existing and working(!) code.
The only outcome is git history pollution that makes git blame
less efficient.

Thanks,
//richard
