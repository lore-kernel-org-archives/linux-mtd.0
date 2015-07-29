MIME-Version: 1.0
In-Reply-To: <20150729140046.GB11082@sirena.org.uk>
References: <cover.1438170519.git.hramrach@gmail.com>
 <557c1962448393b2a8736f26bfa2a3a5ba4aeb7a.1438170519.git.hramrach@gmail.com>
 <20150729140046.GB11082@sirena.org.uk>
From: Michal Suchanek <hramrach@gmail.com>
Date: Wed, 29 Jul 2015 18:19:24 +0200
Message-ID: <CAOMqctTZVET=U=2o65HpWSm4W660XZtYYbBND2k4u9CnfjfMhQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] dt: spi: s3c64xx: add compatible to
 controller-data
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Padmavathi Venna <padma.kvr@gmail.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 29 July 2015 at 16:00, Mark Brown <broonie@kernel.org> wrote:
> On Wed, Jul 29, 2015 at 12:19:57PM +0200, Michal Suchanek wrote:
>
> Please use subject lines matching the style for the subsytsem so people
> can spot that the patch is in some way relevant.
>
>> The controller-data subnode has no compatible. This can lead to other
>> drivers getting confused by it. Add a compatible to make devicetreee
>> unambiguous.
>
> I can't tell from this commit message what the issue you're trying to
> fix is, sorry.  Nodes without compatible strings are entirely normal and
> don't need compatible strings.  It sounds like a bug in whatever other
> driver is becoming confused.

The driver that gets confused is ofpart.

The two-line patch to allow it to just ignore controller-data has been
rejected on the basis that s3c64xx should use a compatible string
because ofpart monopolizes all nodes without compatible which are
children of a mtd device. Devicetrees containing such nodes that are
not partitions are presumably invalid and should be rejected when
ofpart is compiled into the kernel.

>
>> +     if (!of_get_property(data_np, "compatible", NULL) ||
>> +         strcmp(of_get_property(data_np, "compatible", NULL),
>> +                "samsung,s3c-controller-data"))
>> +             dev_err(&spi->dev, "child node 'controller-data' does not have correct compatible\n");
>
> This will break all existing users which is not acceptable for
> mainline, we need to preserve compatibility with existing device trees.

It will not break anything. It will just spam dmesg.

Thanks

Michal
