Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EU2Ac-0000yc-CJ
	for linux-mtd@lists.infradead.org; Mon, 24 Oct 2005 09:15:29 -0400
Message-ID: <435CDE62.1010405@ieee.org>
Date: Mon, 24 Oct 2005 09:15:14 -0400
From: Dan Brown <dan_brown@ieee.org>
MIME-Version: 1.0
To: "Joseph M Dupre (AVAB Inc.)" <dupre@avab.com>
References: <434B98B0.776.50BEDB@localhost> <4358C6CA.16998.6EB936@localhost>
In-Reply-To: <4358C6CA.16998.6EB936@localhost>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: docboot: nandwrite:  Input file is not page aligned
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Joseph M Dupre (AVAB Inc.) wrote:

>OK, issue solved.  There is no problem with nandwrite using uClibc 
>librarires.  Docboot works "as advertised" using the uClibc buildroot 
>tools. 
>  
>
Glad to hear it's working for you!  Pity you had so much trouble 
figuring out the problem, but suffering builds character :)

    -Dan

>My problem was that the doc_spl file was getting corrupted when I 
>transferred the image from the build machine to the target.  The 
>ftpget command in the uClibc buildroot environment is truncating the 
>file durring transfer.  Thus the error messages about "not page 
>aligned" were correct.  Sorry.
>
>- Joe 
>  
>
