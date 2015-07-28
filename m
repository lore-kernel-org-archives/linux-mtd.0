Received: from mail-wi0-x233.google.com ([2a00:1450:400c:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZK05V-000155-0w
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2015 08:18:13 +0000
Received: by wibxm9 with SMTP id xm9so148931765wib.1
 for <linux-mtd@lists.infradead.org>; Tue, 28 Jul 2015 01:17:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150727203924.GQ8876@google.com>
References: <cover.1438028045.git.hramrach@gmail.com>
 <2feb6039b908bbe7daf98c0fc3b7c8f725c36ac3.1438028045.git.hramrach@gmail.com>
 <20150727203924.GQ8876@google.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Tue, 28 Jul 2015 10:17:10 +0200
Message-ID: <CAOMqctTThkbfv=sQ9v1i6y+ecGAfkJZ2UuNaZD1y3TJC1_ezjg@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd: ofpart: do not fail probe when no partitions
 exist
To: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 27 July 2015 at 22:39, Brian Norris <computersforpeace@gmail.com> wrote:
> On Mon, Jul 27, 2015 at 08:30:43PM -0000, Michal Suchanek wrote:
> ...
>> The controller-data node contains no partition information and no other
>> subnodes with partition information exist.
>>
>> The ofpart code returns an error when there are subnodes of the flash DT
>> node but no partitions are found. This error is then propagated to
>> mtdpart which propagetes it to MTD probe which fails probing the flash
>> device.
>>
>> Change this condition to a warning so that flash without partitions can
>> be accessed on Exynos with ofpart support compiled in.
>
> You never replied to my suggestion here:
>
> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-June/352206.html
>
> Particularly, "just define a proper compatibile property for [the
> 'controller-data'] subnode, and ofpart.c will naturally handle this".
>
>> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
>>
>> --
>>  - add more verbose explanation
>> ---
>>  drivers/mtd/ofpart.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
>> index aa26c32..a29d29f 100644
>> --- a/drivers/mtd/ofpart.c
>> +++ b/drivers/mtd/ofpart.c
>> @@ -94,10 +94,10 @@ static int parse_ofpart_partitions(struct mtd_info *master,
>>
>>       if (!i) {
>>               of_node_put(pp);
>> -             pr_err("No valid partition found on %s\n", node->full_name);
>> +             pr_warn("No valid partition found on %s\n", node->full_name);
>>               kfree(*pparts);
>>               *pparts = NULL;
>> -             return -EINVAL;
>> +             return 0;
>
> I don't really like this, since it can turn other invalid device trees
> into a silent fallback. I'd really prefer we make it easy to tell the
> difference between a MTD partition subnode and another foo-bar subnode.

Ok, so I don't find it reasonable to have one driver handle devicetree
nodes without compatible property and insist that no other driver ever
defines nodes without a compatible property.

So either drivers that parse nodes without a compatible property
should handle nodes that are meant to be used by other drivers or
*every* driver has to use a compatible property including ofpart and
then no collision can happen.

So this goes both ways - either deal with nodes that have no
compatible but are not for your driver or define a compatible for your
driver. The s3c64xx driver is ahead of ofpart here since it just tries
to read a property from a subnode of particular name and falls back to
default if not present.

All in all there is no 'foo-bar devicetree'. The fact that your driver
does not understand a particular part of a devicetree does not mean
the part is incorrect. You cannot know what drivers will emerge in the
future and what bindings will they use. In fact this very issue shows
that you make wrong assumptions about that.

Thanks

Michal
