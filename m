Received: from mail-ig0-f178.google.com ([209.85.213.178])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WI0tf-0000DQ-4k
 for linux-mtd@lists.infradead.org; Mon, 24 Feb 2014 19:08:59 +0000
Received: by mail-ig0-f178.google.com with SMTP id h18so5368852igc.5
 for <linux-mtd@lists.infradead.org>; Mon, 24 Feb 2014 11:08:37 -0800 (PST)
MIME-Version: 1.0
Sender: glikely@secretlab.ca
In-Reply-To: <530B6FA9.5050902@gmail.com>
References: <1392749474-12936-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1392749474-12936-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <530B6FA9.5050902@gmail.com>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Mon, 24 Feb 2014 19:08:15 +0000
Message-ID: <CACxGe6u7HJD7Cz+6DTUX3QuA=SokZNzZHW-mvsFhq5JCX6tFYQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] of_mtd: Add helpers to get ECC strength and ECC
 step size
To: Boris BREZILLON <b.brezillon.dev@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 24, 2014 at 4:13 PM, Boris BREZILLON
<b.brezillon.dev@gmail.com> wrote:
> On 18/02/2014 19:51, Ezequiel Garcia wrote:
>>
>> This commit adds simple helpers to obtain the devicetree properties
>> that specify the ECC strength and ECC step size to use on a given
>> NAND controller.
>>
>> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
>> ---
>> diff --git a/include/linux/of_mtd.h b/include/linux/of_mtd.h
>> index cb32d9c..c078f99 100644
>> --- a/include/linux/of_mtd.h
>> +++ b/include/linux/of_mtd.h
>> @@ -13,6 +13,8 @@
>>     #include <linux/of.h>
>>   int of_get_nand_ecc_mode(struct device_node *np);
>> +int of_get_nand_ecc_step_size(struct device_node *np)
>> +int of_get_nand_ecc_strength(struct device_node *np)
>
>
> You forgot the semicolon.

Repeat after me: "I shall not post patches that I have not compiled"

g.
