Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17LIZi-0000hc-00
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2002 08:11:18 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3D12C14A.7050903@ctam.com.au> 
References: <3D12C14A.7050903@ctam.com.au>  <3D127644.3050004@ctam.com.au> <3D115F9B.9030203@ctam.com.au> <12942.1024563800@redhat.com> <10394.1024620838@redhat.com> <3D12BAE1.3050400@ctam.com.au> 
To: brendan.simon@ctam.com.au
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: doc2000 nftl[abcd] devices 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 21 Jun 2002 08:11:14 +0100
Message-ID: <17421.1024643474@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

brendan.simon@ctam.com.au said:
>  Does it make sense to put an nb_block_start in the NFTLRecord
> structure  or would it better to pass this information to the
> NFTL_mount() and  find_boot_records() functions.

> When reading information from nftlb, nftlbc, etc, how does the device
> driver know where the first block of the device is ? Does it need to
> know or does it use some of the other variables such as  EUN, VUN,
> etc.

In general, the MediaHeader block is the first block of the NFTL. The 
MediaHeader does contain information on the size of the NFTL, so in the 
case you described before, you should get the correct results.

Suggested plan for NFTL_setup is to start scanning at the beginning, 
calling find_boot_record(s, 0), then if find_boot_record finds one, then 
set it up accordingly and then call find_boot_record(s, <xxx>) again, where 
<xxx> is the sector after the end of the NFTL it just found.

Obviously you need to extend find_boot_record() to take a second argument
too. That's a two-line change.

--
dwmw2
