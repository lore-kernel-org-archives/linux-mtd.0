Received: from mail-wi0-x235.google.com ([2a00:1450:400c:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZLIru-0000cK-6u
 for linux-mtd@lists.infradead.org; Fri, 31 Jul 2015 22:33:34 +0000
Received: by wicgj17 with SMTP id gj17so35264033wic.1
 for <linux-mtd@lists.infradead.org>; Fri, 31 Jul 2015 15:33:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150731192458.457c6c9d@bbrezillon>
References: <cover.1438340815.git.hramrach@gmail.com>
 <4982216b5cb602c71ade6810cecdb9535e0862fc.1438340815.git.hramrach@gmail.com>
 <20150731180614.162852ee@bbrezillon>
 <CAOMqctROw6wrKa+3jF275m=nd6qy7mRy0k3ztJB5s2Vy8r=DZw@mail.gmail.com>
 <20150731192458.457c6c9d@bbrezillon>
From: Michal Suchanek <hramrach@gmail.com>
Date: Sat, 1 Aug 2015 00:32:32 +0200
Message-ID: <CAOMqctS4jXf=Mr=pUk6QLdtsrKAh6usXmj6hRiMUyrC7z_WPzQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] mtd: ofpart: move ofpart partitions to a dedicated
 dt node
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 31 July 2015 at 19:24, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Fri, 31 Jul 2015 18:52:01 +0200
> Michal Suchanek <hramrach@gmail.com> wrote:
>
>
>> >
>> >>               (*pparts)[i].offset = of_read_number(reg, a_cells);
>> >>               (*pparts)[i].size = of_read_number(reg + a_cells, s_cells);
>> >>
>> >> @@ -92,15 +116,15 @@ static int parse_ofpart_partitions(struct mtd_info *master,
>> >>               i++;
>> >>       }
>> >>
>> >> -     if (!i) {
>> >> -             of_node_put(pp);
>> >> -             pr_err("No valid partition found on %s\n", node->full_name);
>> >> -             kfree(*pparts);
>> >> -             *pparts = NULL;
>> >> -             return -EINVAL;
>> >> -     }
>> >> -
>> >
>> > Are you sure you can safely remove this check?
>>
>> Yes. It was incomplete check to reject some partitioning schemes
>> considered invalid.
>>
>> Now there is stricter checking above so this can be removed.
>
> Indeed, I was worried about resources deallocation, but this is handle
> by the caller, and if nr_parts is zero the master MTD device will
> be exposed.

Due to compatibility with the previous scheme there is still
possibility that partitions are allocated, and no partitions are
returned due to the nr_parts--;

So yes, the pparts could possibly leak in this case if there were more
partition parsers following ofpart and should be deallocated.

Thanks

Michal
