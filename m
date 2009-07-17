Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRnZL-0008Rd-6v
	for linux-mtd@lists.infradead.org; Fri, 17 Jul 2009 13:33:51 +0000
Message-ID: <4A607D9D.6090301@gmail.com>
Date: Fri, 17 Jul 2009 16:33:17 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: subrata@linux.vnet.ibm.com
Subject: Re: [PATCH] Clean up some extra unused arguments in fs/ubifs/
References: <20090717062101.11440.49299.sendpatchset@subratamodak.linux.ibm.com>	
	<1247815718.11353.177.camel@localhost.localdomain>
	<1247837392.5690.3.camel@subratamodak.linux.ibm.com>
In-Reply-To: <1247837392.5690.3.camel@subratamodak.linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Sachin P Sant <sachinp@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>,
	Stefan Richter <stefanr@s5r6.in-berlin.de>, linux-mtd@lists.infradead.org,
	Balbir Singh <balbir@linux.vnet.ibm.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Subrata Modak wrote:
> On Fri, 2009-07-17 at 10:28 +0300, Artem Bityutskiy wrote:
>> On Fri, 2009-07-17 at 11:51 +0530, Subrata Modak wrote:
>>> Hi,
>>>
>>> "const struct ubifs_info *c" exists as an extra argument for major
>>> function definitions under the "fs/ubifs/*" code. The reason why
>>> this extra argument exists is based on assumtion that there
>>> will be several key schemes. It is possible to add more than one,
>>> but we use only one. When there is practically no usage of them
>>> presently, they can be removed, and if needed can be added later.
>>>
>>> The following patch does that by removing:
>>> 1) "const struct ubifs_info *c" where it is not used/necessary,
>>> 2) remove xent_key_init_hash() function, as it is also not used,
>>> 3) remove data_key_init_flash() function, as it is also not used anywhere,
>> Fine with 2 and 3. Not fine with 1, unless it makes the code smaller
>> or more optimal.
> 
> Hmmm. I see. But, it took 95% of my effort.

But yesterday I said that I would not like to remove that argument
unless it makes the code larger. You answered you would check this.
And then you came up with this patches.

> Ok then, do you want me to
> send a separate patch for 2) & 3), or, you will automatically isolate
> them from the sent one.

I can isolate them myself, thanks for the patch.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
