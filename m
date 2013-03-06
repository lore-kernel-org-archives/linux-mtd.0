Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UD5Dt-0003Ie-E2
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2013 03:40:58 +0000
Received: from [192.168.12.102] (235.sub-70-199-129.myvzw.com [70.199.129.235])
 (authenticated bits=0)
 by smtp.newsguy.com (8.14.3/8.14.3) with ESMTP id r263edmY060300
 for <linux-mtd@lists.infradead.org>; Tue, 5 Mar 2013 19:40:53 -0800 (PST)
 (envelope-from mikedunn@newsguy.com)
Message-ID: <5136BAD5.1030109@newsguy.com>
Date: Tue, 05 Mar 2013 19:41:09 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Diskonchip regression
References: <1362389632.763807690@f177.mail.ru>
 <1362496578.21850.1.camel@sauron>
In-Reply-To: <1362496578.21850.1.camel@sauron>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/05/2013 07:16 AM, Artem Bityutskiy wrote:
> On Mon, 2013-03-04 at 13:33 +0400, Alexander Shiyan wrote:
>> Hello All.
>>
>> I want to inform about diskonchip regression.
>> Mounting diskonchip partition now failed due "mtd: nand: kill NAND_NO_READRDY" commit.
> 
> Which diskonchip is that? I was thinking about submitting an RFC about
> killing all diskonchip stuff except of doc3g and docg4.
> 

I was surprised to learn of a user of the legacy diskonchips out there.

Mike
