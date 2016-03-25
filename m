Date: Fri, 25 Mar 2016 15:01:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Lakshmi Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Cc: Michal Simek <michals@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Stephen Warren <swarren@nvidia.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Andrew F. Davis" <afd@ti.com>, Marek Vasut <marex@denx.de>,
 Jagan Teki <jteki@openedev.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Harini Katakam <harinik@xilinx.com>,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>,
 Anirudha Sarangi <anirudh@xilinx.com>
Message-ID: <20160325150109.GF2566@sirena.org.uk>
References: <1458562809-36114-1-git-send-email-lakshmis@xilinx.com>
 <20160321130734.GS2566@sirena.org.uk>
 <4FF8F58FAA9D5D4193D4E554E4352C5902C6D34C@XAP-PVEXMBX02.xlnx.xilinx.com>
 <20160322100615.GA2566@sirena.org.uk>
 <4FF8F58FAA9D5D4193D4E554E4352C5902C6DB59@XAP-PVEXMBX02.xlnx.xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="K4TeRK2lnUi9hBXL"
Content-Disposition: inline
In-Reply-To: <4FF8F58FAA9D5D4193D4E554E4352C5902C6DB59@XAP-PVEXMBX02.xlnx.xilinx.com>
Subject: Re: [LINUX PATCH 1/2] mtd: Added dummy entry in the spi_transfer
 structure.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--K4TeRK2lnUi9hBXL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 25, 2016 at 01:41:16PM +0000, Lakshmi Sai Krishna Potthuri wrote:

As I'm fairly sure I've said before please fix your mail client to word
wrap within paragraphs at something substantially less than 80 columns.
Doing this makes your messages much easier to read and reply to.

> >This is really not what I'd expect to happen, I'd expect that these dummy
> >cycles would be in addition to the actual data (see my request for better
> >documentation...).  If they overlap with the data then what is the point in
> >specifying this?  It's more work for the host, what benefit do we get from
> >doing it over just handing it like a normal byte?

> len field in the transfer structure contains dummy bytes along with actual data
> bytes, controllers which requires dummy bytes use len field and simply Ignore
> the dummy field (contains only no of cycles)added in this patch. Controllers
> (like ZynqMP GQSPI) expects dummy in cycles won't work directly by using
> len field because host driver doesn't know that len field of a particular transfer
> includes dummy bytes or not (and also number of dummy bytes included in len
> field). In such cases driver use this dummy field to identify the number of dummy
> cycles and based on that it will send the required number of dummy cycles (which
> i did in the second patch).

This doesn't make any sense at all to me.  Why does the controller care
what the bytes being sent to and from the device mean?

--K4TeRK2lnUi9hBXL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW9VKzAAoJECTWi3JdVIfQ+MIH/1+HkvEE6Ni1KnJoU+HCfSgl
aXmOYcM7VHQ2AKBsnlXNFxkc0sPdxUsdB3pihdNK/RSzxjsUy0apliTeCal4Nr11
jUfGPFc5CYoWGgta6JZFEzQ9pOarVNyrQrc+z7IrutwehLqV9rGnf9Q9kZBJ10ii
bpCN/GT/Nlq8J6CY6SkDFuhjuqZfiueRx2xGDQfXY1Cs+L1YmLoY4Czm2eg4mPbd
H7vFjrTvcsiNb4H5OTUqvpFs4YVXMxoW37ta9TvOWKVZUiidCfzL8G4JzrIFpGwV
bnIWeqSV3vgroCWvIdXKGxy/Fau1A/JT/lf7kayH1LGR+CzkGzYg0bJ93z0HX6g=
=bEvJ
-----END PGP SIGNATURE-----

--K4TeRK2lnUi9hBXL--
