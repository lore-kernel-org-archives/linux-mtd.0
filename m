Received: from mail-la0-x229.google.com ([2a00:1450:4010:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Un7Lw-0003zS-FH
 for linux-mtd@lists.infradead.org; Thu, 13 Jun 2013 13:14:13 +0000
Received: by mail-la0-f41.google.com with SMTP id fn20so9009789lab.14
 for <linux-mtd@lists.infradead.org>; Thu, 13 Jun 2013 06:13:48 -0700 (PDT)
Message-ID: <51B9C587.4020307@cogentembedded.com>
Date: Thu, 13 Jun 2013 17:13:43 +0400
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
MIME-Version: 1.0
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH 6/6] mtd: ofpart: add compatible check for child nodes
References: <1370860014-1770-1-git-send-email-josh.wu@atmel.com>
 <1370860014-1770-7-git-send-email-josh.wu@atmel.com>
 <51B5C80D.2030303@cogentembedded.com> <51B93FA2.7040206@atmel.com>
In-Reply-To: <51B93FA2.7040206@atmel.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: nicolas.ferre@atmel.com, plagnioj@jcrosoft.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

On 13-06-2013 7:42, Josh Wu wrote:

>>> If the child node has compatible property then it is a driver not
>>> partition.

>>> Signed-off-by: Josh Wu <josh.wu@atmel.com>
>>> ---
>>>   drivers/mtd/ofpart.c |   14 +++++++++++++-
>>>   1 file changed, 13 insertions(+), 1 deletion(-)


>>> diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
>>> index 553d6d6..61ce1f8 100644
>>> --- a/drivers/mtd/ofpart.c
>>> +++ b/drivers/mtd/ofpart.c
>> [...]
>>> @@ -40,8 +44,13 @@ static int parse_ofpart_partitions(struct mtd_info
>>> *master,
>>>       /* First count the subnodes */
>>>       pp = NULL;
>>>       nr_parts = 0;
>>> -    while ((pp = of_get_next_child(node, pp)))
>>> +    while ((pp = of_get_next_child(node, pp))) {

>>    Assignment in *while*? Is scripts/checkpatch.pl happy about that?

> yes, checkpatch.pl has no complain  ;-)

    It seems checkpatch.pl only complains about *if*. Not very consistent...

WBR, Sergei
