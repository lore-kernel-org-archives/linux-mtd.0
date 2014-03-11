Received: from mail-pb0-x236.google.com ([2607:f8b0:400e:c01::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNPm0-0004jv-1N
 for linux-mtd@lists.infradead.org; Tue, 11 Mar 2014 16:43:24 +0000
Received: by mail-pb0-f54.google.com with SMTP id ma3so9028534pbc.41
 for <linux-mtd@lists.infradead.org>; Tue, 11 Mar 2014 09:43:02 -0700 (PDT)
Date: Tue, 11 Mar 2014 09:42:58 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH V4] mtd: gpmi: fix the bitflips for erased pag
Message-ID: <20140311164258.GO31517@norris-Latitude-E6410>
References: <20980858CB6D3A4BAE95CA194937D5E73EAB0919@DBDE04.ent.ti.com>
 <20140311164109.GN31517@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140311164109.GN31517@norris-Latitude-E6410>
Cc: Elie De Brauwer <eliedebrauwer@gmail.com>,
 "bpringlemeir@nbsps.com" <bpringlemeir@nbsps.com>,
 Huang Shijie <b32955@freescale.com>,
 "Vikram.Narayanan@in.bosch.com" <Vikram.Narayanan@in.bosch.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 11, 2014 at 09:41:09AM -0700, Brian Norris wrote:
> I just spun a patch set and CC'd all of you. I think it's
> at least an improvement on the independent solutions I've seen so far.

In cased I missed anyone on CC who was interested:

http://lists.infradead.org/pipermail/linux-mtd/2014-March/052507.html

Brian
