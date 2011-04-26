Received: from sh78.surpasshosting.com ([72.29.64.142])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QEdAx-0007Op-AO
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2011 07:59:15 +0000
Message-ID: <4DB67B94.7090200@embedded-sol.com>
Date: Tue, 26 Apr 2011 11:00:20 +0300
From: Felix Radensky <felix@embedded-sol.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] mtdconcat: Fix NAND OOB write
References: <1303685832-17285-1-git-send-email-felix@embedded-sol.com>
	<1303803830.2778.24.camel@localhost>
In-Reply-To: <1303803830.2778.24.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On 04/26/2011 10:43 AM, Artem Bityutskiy wrote:
> On Mon, 2011-04-25 at 01:57 +0300, Felix Radensky wrote:
>> Currently mtdconcat is broken for NAND. An attemtpt to create
>> JFFS2 filesystem on concatenation of several NAND devices fails
>> with OOB write errors. This patch fixes that problem.
>>
>> Signed-off-by: Felix Radensky<felix@embedded-sol.com>
> Looks like material for -stable, no?

Adding this to -stable would be great.

Felix.
