Received: from gatekeeper.tait.co.nz ([202.37.96.11])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gk5f4-0003cu-QB
	for linux-mtd@lists.infradead.org; Tue, 14 Nov 2006 16:17:47 -0500
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by localhost.tait.co.nz (Postfix) with ESMTP id 1F537467D8
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Nov 2006 10:17:37 +1300 (NZDT)
Received: from sunstrike.tait.co.nz (sunstrike [172.25.40.92])
	by gatekeeper.tait.co.nz (Postfix) with ESMTP id DEA3846755
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Nov 2006 10:17:36 +1300 (NZDT)
Received: from conversion-daemon.sunstrike.tait.co.nz by sunstrike.tait.co.nz
	(Sun Java System Messaging Server 6.1 (built Apr 28 2004))
	id <0J8Q00001L2KLM00@sunstrike.tait.co.nz>
	(original mail from robin.gilks@tait.co.nz) for
	linux-mtd@lists.infradead.org;
	Wed, 15 Nov 2006 10:17:35 +1300 (NZDT)
Date: Wed, 15 Nov 2006 10:17:25 +1300
From: Robin Gilks <robin.gilks@tait.co.nz>
Subject: Re: Kernel oops in jffs2 mount - any ideas?
In-reply-to: <4559775D.8030009@transmode.se>
To: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
Message-id: <455A3265.7060408@tait.co.nz>
MIME-version: 1.0
Content-type: text/plain; format=flowed; charset=ISO-8859-1
Content-transfer-encoding: 7BIT
References: <4553C6CB.2040207@tait.co.nz> <1163146170.3925.7.camel@sauron>
	<4557E56F.8070100@tait.co.nz> <1163411683.3925.31.camel@sauron>
	<4559412C.8080102@tait.co.nz> <4559775D.8030009@transmode.se>
Cc: MTD mail list <linux-mtd@lists.infradead.org>
Reply-To: robin.gilks@tait.co.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Joakim Tjernlund wrote:
> Robin Gilks wrote:
>> Artem Bityutskiy wrote:
>>
>>   
>>> So the crash is somewhere in the CFI code. You should try to dig it and
>>> realize why it oopses.
>>>     
>> Pretty much at the same point except now its the garbage collector 
>> crashing and leaving a lock on an inode so the kernel stalls.
>>
>> No clues as to what is going on though :-(
>>
>>
>> HELP!
>>
>>   
> You should apply the bug fix I sent the other day(Re: cfi_cmd0001.c
> broken w.r.t Erase Suspend solved, patch included).
> This closes nasty bug that I think should be applied to linus tree ASAP.
> 
>  Jocke

Patch already applied a couple of days ago - I've been grasping at 
straws for 4 days now!! I think I might be getting further with my 
bdi2000 to get better debug info anyway.

Thanks

-- 
Robin


=======================================================================
This email, including any attachments, is only for the intended
addressee.  It is subject to copyright, is confidential and may be
the subject of legal or other privilege, none of which is waived or
lost by reason of this transmission.
If the receiver is not the intended addressee, please accept our
apologies, notify us by return, delete all copies and perform no
other act on the email.
Unfortunately, we cannot warrant that the email has not been
 altered or corrupted during transmission.
=======================================================================
