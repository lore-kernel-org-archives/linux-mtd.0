Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEVoD-00058p-4u
 for linux-mtd@lists.infradead.org; Wed, 28 Aug 2013 02:48:37 +0000
Received: by mail-pa0-f50.google.com with SMTP id fb10so5635390pad.37
 for <linux-mtd@lists.infradead.org>; Tue, 27 Aug 2013 19:48:15 -0700 (PDT)
Message-ID: <521D64ED.5090109@gmail.com>
Date: Tue, 27 Aug 2013 19:48:13 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v3 01/10] mtd: nand: rename the cellinfo to bits_per_cell
References: <1377509808-29363-1-git-send-email-b32955@freescale.com>
 <1377509808-29363-2-git-send-email-b32955@freescale.com>
 <521CDD97.6070203@gmail.com> <521D6382.2080403@gmail.com>
 <521D6434.3020604@freescale.com>
In-Reply-To: <521D6434.3020604@freescale.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Vikram Narayanan <vikram186@gmail.com>, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/27/2013 07:45 PM, Huang Shijie wrote:
> 于 2013年08月28日 10:42, Brian Norris 写道:
>> Or, I guess it's helpful to first add the nand_is_slc() helper in one
>> patch (using the existing 'cellinfo' field), then introduce the simple
>> patch to change 'cellinfo' to 'bits_per_cell'. Maybe that's what you
>> were recommending?
> I ever thought of this method, but it will add more patches.

Use your best judgment. We tread a fine line between time 
wasting/bikeshedding and readability/understandability here. But 
splitting this to 2 patches is probably helpful and reasonable.

Brian
