Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHxiT-0000oX-C8
 for linux-mtd@lists.infradead.org; Mon, 24 Feb 2014 15:45:14 +0000
Received: by mail-wi0-f172.google.com with SMTP id e4so3244000wiv.5
 for <linux-mtd@lists.infradead.org>; Mon, 24 Feb 2014 07:44:51 -0800 (PST)
Message-ID: <530B68F0.5050406@gmail.com>
Date: Mon, 24 Feb 2014 16:44:48 +0100
From: Boris BREZILLON <b.brezillon.dev@gmail.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v2 1/2] of_mtd: Add helpers to get ECC strength and ECC
 step size
References: <1392749474-12936-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1392749474-12936-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <5303BC07.2090300@gmail.com> <20140218202552.GB13799@localhost>
In-Reply-To: <20140218202552.GB13799@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Grant Likely <grant.likely@secretlab.ca>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 18/02/2014 21:25, Ezequiel Garcia wrote:
> On Tue, Feb 18, 2014 at 09:01:11PM +0100, Boris BREZILLON wrote:
>> Le 18/02/2014 19:51, Ezequiel Garcia a écrit :
>>> This commit adds simple helpers to obtain the devicetree properties
>>> that specify the ECC strength and ECC step size to use on a given
>>> NAND controller.
>> As already discussed with you, IMHO these 2 properties should both
>> be available to be meaningful, hence, we should provide an helper
>> function that gets both properties or return an error if one of them
>> is missing.
>>
> I think this way is both cleaner and simpler. I don't see the advantage
> of having a single function.

Okay, I'll ack this version and do the check in my driver then.

Thanks.

Best Regards,

Boris
>
>> Do you plan to provide a default value (within controller drivers) if one
>> of these properties is missing ? In this case seperating the helper
>> functions make sense.
>>
> Being a general framework, we can't know what drivers will want to do,
> which is why I usually like helper function to say as simple as
> policy-free as possible.
