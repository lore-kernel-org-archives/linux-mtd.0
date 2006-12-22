Subject: Re: Transfer rates with NAND
From: David Woodhouse <dwmw2@infradead.org>
To: Indrek Kruusa <indrek.kruusa@artecdesign.ee>
In-Reply-To: <458A73AF.2040307@artecdesign.ee>
References: <458A73AF.2040307@artecdesign.ee>
Content-Type: text/plain
Date: Fri, 22 Dec 2006 02:26:52 +0000
Message-Id: <1166754412.22068.47.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-12-21 at 13:44 +0200, Indrek Kruusa wrote:
> I am wondering which NAND transfer rates are seen in embedded Linux 
> projects. What to expect from the whole hardware/software subsystem?
> I have one Geode LX design with CS5536 companion chip which by using 
> built-in 8-bit Flash controller on PCI bus gives me slightly over 2MB/s. 
> It's almost the same with Linux MTD driver and with a self-made basic 
> driver. Is the speed here the matter of flash controller only? Which is 
> the fastest flash controller out there? :)

The CS5536 NAND flash controller is fairly crap in terms of performance
-- you don't get burst read/write transactions over PCI with it, so it
goes very slowly as it has to do the whole PCI setup thing for every 4
bytes.

You'll get a maximum of something like 3 MiB/s from it IIRC. From a
better controller and a decent chip you might get close to ten times
that; at least in theory.

-- 
dwmw2
