Date: Fri, 29 Jun 2007 12:54:32 +0100 (BST)
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexander Schmidt <alexs@linux.vnet.ibm.com>
Subject: Re: [PATCH] UBI-Utils: ubimirror discards returncode
In-Reply-To: <200706291246.11487.alexs@linux.vnet.ibm.com>
Message-ID: <Pine.LNX.4.64.0706291249040.20045@pentafluge.infradead.org>
References: <200706291246.11487.alexs@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Andreas Arnez <arnez@linux.vnet.ibm.com>,
	Frank Haverkamp <haver@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 29 Jun 2007, Alexander Schmidt wrote:
> Ubimirror compares volumes before they are mirrored, but discards the
> result of the comparison and alway copies volumes.
>
> I've tested this code with equal and unequal volumes and it seems to work
> fine now.
>
> Signed-off-by: Alexander Schmidt <alexs@linux.vnet.ibm.com>

Thanks.
