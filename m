From: Joakim.Tjernlund@infinera.com (Joakim Tjernlund)
Date: Wed, 16 Jan 2019 08:50:26 +0000
Subject: [PATCH] mtd: cfi: Fixed endless loop problem in CFI when value
 was written but corrupted.
In-Reply-To: <acd7f2257808f78aa76840e6789c7f65c08986ef.camel@infinera.com>
References: <20190116003211.GA57460@dev-dsk-psobon-2c-1dd9f399.us-west-2.amazon.com>
 <acd7f2257808f78aa76840e6789c7f65c08986ef.camel@infinera.com>
Message-ID: <414bf181e3b17ff5e97107850e65da476000f5ea.camel@infinera.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Wed, 2019-01-16 at 08:33 +0000, Joakim Tjernlund wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> On Wed, 2019-01-16 at 00:32 +0000, Przemyslaw Sobon wrote:
> > 
> > There was an endless loop in CFI Flash driver when a value was written
> > incorrectly. In such case chip_ready returns true but chip_good returns
> > false and we never get out of the loop.
> > 
> > The solution was to break the loop in 2 cases, either device is ready or
> > device is not ready and timeout elapsed. The correctness of the write is
> > checked after the loop ended. That way we ensure the loop always ends.
> > 
> > Signed-off-by: Przemyslaw Sobon <psobon@amazon.com>
> 
> hmm, current code was introduced by Tokunori Ikegami <ikegami@allied-telesis.co.jp> to address another problem he had.

Seems like Tokunori Ikegami's email address is invalid now ...
