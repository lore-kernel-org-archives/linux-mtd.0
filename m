Received: from mail9.messagelabs.com ([194.205.110.133])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AlQJk-0004TW-Ud
	for linux-mtd@lists.infradead.org; Tue, 27 Jan 2004 10:19:37 +0000
Message-ID: <40163B1F.1010702@cantab.net>
Date: Tue, 27 Jan 2004 10:19:11 +0000
From: David Vrabel <dvrabel@cantab.net>
MIME-Version: 1.0
To: Linux MTD List <linux-mtd@lists.infradead.org>
References: <3FD998F6.9000303@arcom.com> <3FDDD939.8030302@arcom.com>
	<4014E81E.4090808@arcom.com>
	<1075129557.24024.81.camel@hades.cambridge.redhat.com>
In-Reply-To: <1075129557.24024.81.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: cfi_cmdset_0002 -- erase suspends broken.
Reply-To: dvrabel@arcom.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> On Mon, 2004-01-26 at 10:12 +0000, David Vrabel wrote:
> 
>>>The problem with the occasional bit errors appears to only occur 
>>>when the erase is suspended for a write so I've temporarily disabled
>>>that.
>>
>>Seems I left the patch off that does this.
> 
> Thanks. Wanna go ahead and commit it?

Done.  MTD CVS should now work on AMD chips though performance will be 
poor when used with (for example) JFFS2.

David Vrabel



_____________________________________________________________________
The message in this transmission is sent in confidence for the attention of the addressee only and should not be disclosed to any other party. Unauthorised recipients are requested to preserve this confidentiality. Please advise the sender if the addressee is not resident at the receiving end.  Email to and from Arcom is automatically monitored for operational and lawful business reasons.

This message has been checked for all viruses by MessageLabs Virus Control Centre.
