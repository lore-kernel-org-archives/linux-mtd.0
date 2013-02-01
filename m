Received: from mail.prodrive.nl ([212.61.153.67])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U1K8y-0007Wb-A7
 for linux-mtd@lists.infradead.org; Fri, 01 Feb 2013 17:11:16 +0000
Message-ID: <510BF720.5020708@prodrive.nl>
Date: Fri, 1 Feb 2013 18:10:56 +0100
From: Stef van Os <stef.van.os@prodrive.nl>
MIME-Version: 1.0
To: <artem.bityutskiy@linux.intel.com>
Subject: Re: [PATCH 1/1] mtd: physmap_of: fix illegal dereference
References: <1358446932-7238-1-git-send-email-stef.van.os@prodrive.nl>
 <1359737697.2942.16.camel@sauron.fi.intel.com>
In-Reply-To: <1359737697.2942.16.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 wfp5p@virginia.edu, linux-mtd@lists.infradead.org, sr@denx.de,
 plagnioj@jcrosoft.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/01/2013 05:54 PM, Artem Bityutskiy wrote:
> On Thu, 2013-01-17 at 19:22 +0100, Stef van Os wrote:
>> d68cbdd introduced a new way of getting the name of an mtd
>> partion. The character pointer is not initialized, and only
>> checked against NULL, not at other random garbage.
>> This patch fixes the resulting panic.
>>
>> Signed-off-by: Stef van Os<stef.van.os@prodrive.nl>
> A similar fix already sits in the mtd tree:
>
> http://git.infradead.org/mtd-2.6.git/commit/7dfe4be351e81656ca1068e5d4ead235c7ba94b1
>
Ah, sorry, I wasn't aware of this. But, as long as some fix for this 
issue makes it into mainline, I'm happy :)
