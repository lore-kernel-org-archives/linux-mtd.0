Received: from www.aostechnologies.com ([195.134.130.80] helo=pip5.mpl.ch)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A9fyB-0001My-P5
	for <linux-mtd@lists.infradead.org>; Wed, 15 Oct 2003 08:21:19 +0100
Received: from elsoft.ch (IDENT:1000@pcdm.elsoft.loc [192.168.11.10])
	h9F7K153016781
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <linux-mtd@lists.infradead.org>; Wed, 15 Oct 2003 09:20:15 +0200
Message-ID: <3F8CF52E.1050502@elsoft.ch>
Date: Wed, 15 Oct 2003 09:20:14 +0200
From: =?ISO-8859-1?Q?=22David_M=FCller_=28ELSOFT_AG=29=22?=
 <d.mueller@elsoft.ch>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <3C6BEE8B5E1BAC42905A93F13004E8AB03202232@mailse01.axis.se>
In-Reply-To: <3C6BEE8B5E1BAC42905A93F13004E8AB03202232@mailse01.axis.se>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Subject: Re: word line disturbance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

Magnus Mårtensson wrote:
> Hi.
> I had a discussion with flash manufacturer Atmel last week regarding a phenomenon that we had seen. 
> The phenomenon was called "word line disturbance" and it could occur if you tried to program only ones
> to a location that already contained ones. The result could be that some bit on another address got tainted. Ex
> writing 0xffff to address A could result in the content on address B changing from 0xffff to 0xfffe.
> 

Does anybody know more about the technical background of this "it's not
a bug, it's a feature" problem? Or is it just a manager driven decision
to save some money at the wrong place?


Dave
