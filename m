Date: Fri, 12 Oct 2007 15:11:35 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: linux-mtd@lists.infradead.org, nico@cam.org
Subject: Recursion in CFI driver. Is it really necessary to have.
Message-ID: <Pine.LNX.4.64.0710121451280.15790@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We encountered some problems with CFI driver (cfi_cmdset_0001.c). Investigation showed that it is rather possible that the issues are related to recursion call of get_chip function. 
I am just wondering if it really needed to have the recursion in CFI drivers. From point of Flash commands the maximum necessary depth of recursive calls should be 1. (To handle suspend operatons). 
What do you think of little modification here? 
I will add some more debugging to make sure if problems are related to recursion or ont.
