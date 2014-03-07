Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLpqF-0005uW-6V
 for linux-mtd@lists.infradead.org; Fri, 07 Mar 2014 08:09:16 +0000
Received: by mail-pa0-f45.google.com with SMTP id kl14so3844205pab.32
 for <linux-mtd@lists.infradead.org>; Fri, 07 Mar 2014 00:08:52 -0800 (PST)
Date: Fri, 7 Mar 2014 00:08:45 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v3 2/3] mtd: nand: add new parsing rule for Hynix's
 H27UBG8T2CTR
Message-ID: <20140307080845.GJ31517@norris-Latitude-E6410>
References: <1388736518-5934-1-git-send-email-b32955@freescale.com>
 <1388736518-5934-3-git-send-email-b32955@freescale.com>
 <20140307074657.GF31517@norris-Latitude-E6410>
 <53197C8D.3010604@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53197C8D.3010604@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 07, 2014 at 04:00:13PM +0800, Huang Shijie wrote:
> 于 2014年03月07日 15:46, Brian Norris 写道:
> >Are you sure you need to use the device ID (0xD7)? It's best if we don't
> >have to constrain ourselves to particular flash sizes here... Are there
> >Hynix MLC that don't follow the id_data[5] pattern for differentiating
> >technology types (>20nm vs<=20nm)? I'll have to check my datasheets
> >when I get back in the office.
> >
> The H27UCG8T2ATR is also a 20nm chip whose device ID is 0xDE. Its
> id_data[5] is 0xc4.
> But it also use the old parsing rule: the page size is the multiple of 2K.
> 
> that's why i checked the device ID.

Ugh, what a pain :( What's the point of a decode table, if we don't know
what chips to use it for?

Perhaps could it better to check for dev_id != 0xDE instead? Hopefully
there would be fewer 20nm chips that use the old table than those that
use the new.

I'll try to remember to take a look tomorrow to see how this matches
with the Hynix parts I've seen.

Brian
