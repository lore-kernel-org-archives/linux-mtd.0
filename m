From: David Woodhouse <dwmw2@infradead.org>
To: david stevenson <david@avoncliff.com>
In-Reply-To: <200310302103.42918.david@avoncliff.com>
References: <200310302103.42918.david@avoncliff.com>
Content-Type: text/plain
Message-Id: <1067616737.3423.283.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 31 Oct 2003 16:12:18 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: zlib versions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-10-30 at 21:03 +0000, david stevenson wrote:
> Could someone please educate me on zlib?
> 
> I can compile kernel 2.4.21 with MTD updated from tarball 20031021 with jff2 
> with no errors.
> But when I try and compile the utils from the same tar ball, using the same 
> kernel headers I get error file not found zlib.h.

Do you have the zlib-devel package installed? Are you compiling natively
or cross-compiling?

-- 
dwmw2
