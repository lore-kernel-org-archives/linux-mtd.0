Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNHOy-0002gI-3a
 for linux-mtd@lists.infradead.org; Tue, 11 Mar 2014 07:47:04 +0000
Message-ID: <1394524000.6302.217.camel@sauron.fi.intel.com>
Subject: Re: Corrupt empty space
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kent Li <Kent.Li@radisys.com>
Date: Tue, 11 Mar 2014 09:46:40 +0200
In-Reply-To: <aadf057c868c47128845c19d69933c46@BLUPR08MB103.namprd08.prod.outlook.com>
References: <D2D3E4C4A672E847B422D1E5F695E1A402E61608@sreublc136.eu.labinal.snecma>
 <aadf057c868c47128845c19d69933c46@BLUPR08MB103.namprd08.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 HOUR =?ISO-8859-1?Q?Fr=E9deric?= <frederic.hour@safran-engineering.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-03-11 at 05:31 +0000, Kent Li wrote:
> Frederic,
> 
> I'm not sure if this is the unstable bit issue, but I just resolved such issue by enhancing my Nand driver in both Uboot code and Linux code.
> 
> The main idea is:
> Read a page
> If ( ECC fail ) ;then
> 	Check the how many 0 bit there is.
> 	If ( 0 bit number > tolerance value) //tolerance value is depends on the ECC correctable bits.
> 		Print "Fail to recover by ECC"
> 	Else
> 		Force change the 0 bits to 1
> 	fi
> fi

Off the top of my head, this sounds reasonable. Too bad people people do
not just go and fix this in upstream...

-- 
Best Regards,
Artem Bityutskiy
