Received: from e6.ny.us.ibm.com ([32.97.182.146])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cf3Ao-0006Hj-6x
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2004 16:28:35 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e6.ny.us.ibm.com (8.12.10/8.12.10) with ESMTP id iBGLSW6q032265
	for <linux-mtd@lists.infradead.org>; Thu, 16 Dec 2004 16:28:32 -0500
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	iBGLSWqZ170788
	for <linux-mtd@lists.infradead.org>; Thu, 16 Dec 2004 16:28:32 -0500
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11/8.12.11) with ESMTP id iBGLSWB4030630
	for <linux-mtd@lists.infradead.org>; Thu, 16 Dec 2004 16:28:32 -0500
Message-ID: <41C1FDFF.3020308@us.ibm.com>
Date: Thu, 16 Dec 2004 15:28:31 -0600
From: Josh Boyer <jdub@us.ibm.com>
MIME-Version: 1.0
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
References: <1103152743.15913.33.camel@squizzey.bult.co.uk>	
	<41C0D3AC.3050801@us.ibm.com>	
	<1103158974.15929.37.camel@squizzey.bult.co.uk>	
	<1103201631.25765.7.camel@weaponx.rchland.ibm.com>
	<1103232128.15927.70.camel@squizzey.bult.co.uk>
In-Reply-To: <1103232128.15927.70.camel@squizzey.bult.co.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Gareth Bult (Encryptec) wrote:
> Hi,
> 
>>There is one more feature pending that I know of.  Ferenc Havasi has
>>some eraseblock summary changes that should help.  I believe the
>>intention was to commit that to JFFS3, but I haven't seen it go in yet.
> 
> 
> Ok, I have these and will be trying them presently .. 
> 
> just wondered if there was any way I could avoid running "patch" .. :)

Bug Ferenc to commit ;).  I'm not sure if he subscribes to this list or not.

Also, Artem Bityuckiy is working on an inode checkpoint feature for 
JFFS3.  Once he gets it working, it should increase overall performance.

If you have any ideas or patches, feel free to submit them to the list. 
  That's what JFFS3 was cloned for, and there isn't too much concern 
with backwards compatibility.

josh
