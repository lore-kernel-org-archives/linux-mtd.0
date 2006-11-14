Received: from [212.105.56.244] (helo=dmz.lumentis.net)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GjtCz-0002bI-3i
	for linux-mtd@lists.infradead.org; Tue, 14 Nov 2006 03:00:01 -0500
Message-ID: <4559775D.8030009@transmode.se>
Date: Tue, 14 Nov 2006 08:59:25 +0100
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
MIME-Version: 1.0
To: robin.gilks@tait.co.nz
Subject: Re: Kernel oops in jffs2 mount - any ideas?
References: <4553C6CB.2040207@tait.co.nz>
	<1163146170.3925.7.camel@sauron>	<4557E56F.8070100@tait.co.nz>
	<1163411683.3925.31.camel@sauron> <4559412C.8080102@tait.co.nz>
In-Reply-To: <4559412C.8080102@tait.co.nz>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: MTD mail list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Robin Gilks wrote:
> Artem Bityutskiy wrote:
>
>   
>> So the crash is somewhere in the CFI code. You should try to dig it and
>> realize why it oopses.
>>     
>
> Pretty much at the same point except now its the garbage collector 
> crashing and leaving a lock on an inode so the kernel stalls.
>
> No clues as to what is going on though :-(
>
>
> HELP!
>
>   
You should apply the bug fix I sent the other day(Re: cfi_cmd0001.c
broken w.r.t Erase Suspend solved, patch included).
This closes nasty bug that I think should be applied to linus tree ASAP.

 Jocke
