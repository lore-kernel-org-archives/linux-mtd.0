Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D7BVw-0000ye-W6
	for linux-mtd@lists.infradead.org; Fri, 04 Mar 2005 07:02:41 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: prasadam kumar <prasadamkumar@yahoo.com>
In-Reply-To: <20050304115440.64103.qmail@web11607.mail.yahoo.com>
References: <20050304115440.64103.qmail@web11607.mail.yahoo.com>
Content-Type: text/plain
Date: Fri, 04 Mar 2005 15:02:06 +0300
Message-Id: <1109937726.5169.15.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: IQ80321 flash writing problem
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-03-04 at 03:54 -0800, prasadam kumar wrote:
> hai to all
> 
>  sorry to trouble you again because i am sending this
> problem second time. plz read this problem and give
> me the resons why it is altering some memory
> locations, so i can look into those issues.
> 
> We are working on a task which has to write to a
> IQ80321 flash  which is configured as a
> MTD CHAR device which uses CFI cmdset 0001 in the
> kernel version 2.4.19-rmk7-ds2.
:-)
Before you have caused Thomas's and David's anger, I'll notice that 2.4
branch is regarded as ancient here. Try at least use the latest MTD
snapshot.
