Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRhsd-0000Q0-RV
	for linux-mtd@lists.infradead.org; Fri, 17 Jul 2009 07:29:24 +0000
Subject: Re: [PATCH] Clean up some extra unused arguments in fs/ubifs/
From: Artem Bityutskiy <dedekind@infradead.org>
To: Subrata Modak <subrata@linux.vnet.ibm.com>
In-Reply-To: <20090717062101.11440.49299.sendpatchset@subratamodak.linux.ibm.com>
References: <20090717062101.11440.49299.sendpatchset@subratamodak.linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 17 Jul 2009 10:28:38 +0300
Message-Id: <1247815718.11353.177.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Sachin P Sant <sachinp@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>,
	Stefan Richter <stefanr@s5r6.in-berlin.de>, linux-mtd@lists.infradead.org,
	Adrian Hunter <adrian.hunter@nokia.com>,
	Balbir Singh <balbir@linux.vnet.ibm.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-07-17 at 11:51 +0530, Subrata Modak wrote:
> Hi,
> 
> "const struct ubifs_info *c" exists as an extra argument for major
> function definitions under the "fs/ubifs/*" code. The reason why
> this extra argument exists is based on assumtion that there
> will be several key schemes. It is possible to add more than one,
> but we use only one. When there is practically no usage of them
> presently, they can be removed, and if needed can be added later.
> 
> The following patch does that by removing:
> 1) "const struct ubifs_info *c" where it is not used/necessary,
> 2) remove xent_key_init_hash() function, as it is also not used,
> 3) remove data_key_init_flash() function, as it is also not used anywhere,

Fine with 2 and 3. Not fine with 1, unless it makes the code smaller
or more optimal.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
